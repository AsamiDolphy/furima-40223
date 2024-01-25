class ItemsController < ApplicationController
  @items = Item.order('created_at DESC')

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect to root_path
    else
      binding.pry
      render :new, status: unprocessable_entity
    end
  end

  def index
    @items = Item.all
  end

  private

  def item_oarams
    params.require(:item).permit(:name, :info, :genre_id, :image)
  end
end
