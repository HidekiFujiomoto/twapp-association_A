class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(mutter_id: params[:mutter_id])
    redirect_to mutters_url, notice: "#{favorite.mutter.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(mutter_id: params[:mutter_id]).destroy
    redirect_to mutters_url, notice: "#{favorite.mutter.user.name}さんのブログをお気に入り解除しました"
  end

end
