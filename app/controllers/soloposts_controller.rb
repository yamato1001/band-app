class SolopostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_solopost, only: [:show, :edit, :update, :destroy]

  def index
    @soloposts = Solopost.all.order("created_at DESC")
  end

  def new
    @solopost = Solopost.new
  end

  def create
    @solopost = Solopost.new(solopost_params)

    if @solopost.save
      redirect_to soloposts_path
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
    if @solopost.update(solopost_params)
      redirect_to solopost_path
    else
      render :edit
    end
  end

  def destroy
    @solopost.destroy
    redirect_to solopost_path
  end

  def search
    @soloposts = Solopost.search(params[:keyword])
  end

  private
  def solopost_params
    params.require(:solopost).permit(:nickname, :introduction, :genre_id, :musical_instrument_id, :area_id, :favorite_band, :history, :sns_account, :image, :video ).merge(user_id:current_user.id)
  end

  def set_solopost
    @solopost = Solopost.find(params[:id])
  end

end
