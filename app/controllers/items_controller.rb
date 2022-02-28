class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    if current_user.admin?
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to root_path
    end
  end




  private

  def item_params
    params.require(:item).permit(:image, :item_name, :price)
  end


end
