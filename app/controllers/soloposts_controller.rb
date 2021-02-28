class SolopostsController < ApplicationController
  def index
    @soloposts = Solopost.all.order("created_at DESC")
  end

  def new
    @solopost = Solopost.new
  end

  def create
    @solopost = Solopost.new(solopost_params)

    if @solopost.save
      redirect_to root_path
    else
      render :new
    end

  end

  private
  def solopost_params
    params.require(:solopost).permit(:nickname, :introduction, :genre_id, :musical_instrument_id, :area_id, :favorite_band, :history, :sns_account, :video ).merge(user_id:current_user.id)
  end
end
