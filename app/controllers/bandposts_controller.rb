class BandpostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @bandposts = Bandpost.all.order("created_at DESC")
    @parents = Category.all.order("id ASC").limit(3)
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

  def search
    @bandposts = Bandpost.search(params[:keyword]) 
  end

  def set_category_list
    @category_parent_array = Category.where(ancestry: nil)
  end

  def select_category_index
    # カテゴリ名を取得するために@categoryにレコードをとってくる
    @category = Category.find_by(id: params[:id])

    # 親カテゴリーを選択していた場合の処理
    if @category.ancestry == nil
      # Categoryモデル内の親カテゴリーに紐づく孫カテゴリーのidを取得
      category = Category.find_by(id: params[:id]).indirect_ids
      # 孫カテゴリーに該当するitemsテーブルのレコードを入れるようの配列を用意
      @bandposts = []
      # find_itemメソッドで処理
      find_item(category)

    # 子カテゴリーを選択していた場合の処理
    else
      category = Category.find_by(id: params[:id]).child_ids
      # 孫カテゴリーに該当するitemsテーブルのレコードを入れるようの配列を用意
      @bandposts = []
      # find_itemメソッドで処理
      find_item(category)
    end
  end

  private
  def bandpost_params
    params.require(:bandpost).permit(:bandname, :introduction, :genre_id, :musical_instrument_id, :area_id, :history, :sns_account, :image, :video ).merge(user_id:current_user.id)
  end

end
