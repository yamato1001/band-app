class BandpostsController < ApplicationController
  def index
    @bandposts = Bandpost.all.order("created_at DESC")
  end


  def new
    @bandpost = Bandpost.new
  end

  def create
    @bandpost = Bandpost.new(bandpost_params)

    if @bandpost.save
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    @bandpost = Bandpost.find(params[:id])
  end

  private
  def bandpost_params
    params.require(:bandpost).permit(:bandname, :introduction, :genre_id, :musical_instrument_id, :area_id, :history, :sns_account, :image, :video ).merge(user_id:current_user.id)
  end

end
