module MuttersHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_mutters_path
    elsif action_name == 'edit'
      mutter_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

end
