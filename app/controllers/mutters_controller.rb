class MuttersController < ApplicationController

  before_action :set_mutter, only: [:edit, :update, :destroy]

  def index
    @mutters = Mutter.all
  end

  def new
    if logged_in?
    ### ログインしている場合
      if params[:back]
        # Mutterテーブルのcontentカラムに新規追加 => @mutterへ代入
        @mutter = Mutter.new(mutter_params)
      else
        @mutter = Mutter.new
      end
    ### ログインしていない場合
    else
      # ログイン画面へリダイレクト
      redirect_to new_session_path
    end
  end

  def create
    # Mutterテーブルのcontentカラムに新規追加 => @mutterへ代入
    @mutter = Mutter.new(mutter_params)
    # 現在ログインしているuserのidをmutterのidカラムに代入
    @mutter.id = current_user.id
    # @mutterを保存しtrueの場合
    if @mutter.save
      redirect_to mutters_path, notice: "つぶやきを投稿しました！"
    # falseの場合は、新規投稿画面のまま
    else
      render 'new'
    end
  end

  def confirm
    @mutter = Mutter.new(mutter_params)
    @mutter.id = current_user.id
    render :new if @mutter.invalid?
    #  

  end

  def edit
    if logged_in?
      @mutter = Mutter.new(mutter_params)
    else
      redirect_to new_session_path
    end
  end

  def show
    @favorite = current_user.favorites.find_by(mutter_id: @mutter.id)
    if logged_in?
      @mutter = Mutter.new(mutter_params)
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
    params.require(:mutter).permit(:content, :user_id)
  end

  def set_mutter
    @mutter = Mutter.find(params[:id])
  end
end
