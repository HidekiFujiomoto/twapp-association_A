class MuttersController < ApplicationController

  before_action :set_mutter, only: [:edit, :update, :destroy, :show]

  def index
    if logged_in?
      @mutters = Mutter.all
      @user_id = current_user.id
    else
      redirect_to new_session_path
    end
  end

  def new
    if logged_in?
      if params[:back]
        @mutter = Mutter.new(mutter_params)
      else
        @mutter = Mutter.new
      end
    else
      redirect_to new_session_path
    end
  end

  def create
    @mutter = Mutter.new(mutter_params)
    @mutter.image.retrieve_from_cache!  params[:cache][:image]
    @mutter.user_id = current_user.id
    if @mutter.save(mutter_params)
      redirect_to mutters_path, notice: "つぶやきを投稿しました！"
      # Mailerでユーザーへ作成完了のメッセージを送る
      @user_email = @mutter.user.email
      TweetcreateMailer.send_email(@user_email).deliver
    else
      render 'new'
    end
  end

  def confirm
    binding.pry
    @mutter = Mutter.new(mutter_params)
    @mutter.user_id = current_user.id
    render :new if @mutter.invalid?
  end

  def edit
    if logged_in?
    else
      redirect_to new_session_path
    end
  end

  def show
    if logged_in?
      @favorite = current_user.favorites.find_by(mutter_id: @mutter.id)
    else
      redirect_to new_session_path
    end
  end

  def update
    if @mutter.update(mutter_params)
      redirect_to mutters_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @mutter.destroy
    redirect_to mutters_path, notice:"つぶやきを削除しました！"
  end

  private
  def mutter_params
    params.require(:mutter).permit(:content,:user_id,:image)
  end

  def set_mutter
    @mutter = Mutter.find(params[:id])
  end
end
