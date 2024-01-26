class ItemsController < ApplicationController
  @items = Item.order('created_at DESC')

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price)
  end
end
