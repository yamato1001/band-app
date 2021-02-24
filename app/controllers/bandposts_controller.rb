class BandpostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

  def edit
    @bandpost = Bandpost.find(params[:id])
  end

  def update
    @bandpost = Bandpost.find(params[:id])
    if @bandpost.update(bandpost_params)
      redirect_to bandpost_path
    else
      render :edit
    end
  end

  def destroy
    @bandpost = Bandpost.find(params[:id])
    @bandpost.destroy
    redirect_to root_path
  end

  private
  def bandpost_params
    params.require(:bandpost).permit(:bandname, :introduction, :genre_id, :musical_instrument_id, :area_id, :history, :sns_account, :image, :video ).merge(user_id:current_user.id)
  end

end
