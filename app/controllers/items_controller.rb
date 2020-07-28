class ItemsController < ApplicationController
  before_action :set_params, except: [:index, :new, :create]
  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path      
    else
      render :new
    end
  end

  def confirmation
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :item_status, :shipping_fee, :owner_area, :shipping_date, :seller_id, images_attributes: [:image, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
