class MuttersController < ApplicationController

  before_action :set_mutter, only: [:edit, :update, :destroy]

  def index
    @mutters = Mutter.all
  end

  def new
    if params[:back]
      @mutter = Mutter.new(mutter_params)
    else
      @mutter = Mutter.new
    end
  end

  def create
    @mutter = Mutter.new(mutter_params)
    if @mutter.save
      redirect_to mutters_path, notice: "つぶやきを投稿しました！"
    else
      render 'new'
    end
  end

  def edit
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

  def confirm
    @mutter = Mutter.new(mutter_params)
    render :new if @mutter.invalid?
  end



  private
  def mutter_params
    params.require(:mutter).permit(:content)
  end

  def set_mutter
    @mutter = Mutter.find(params[:id])
  end
end
