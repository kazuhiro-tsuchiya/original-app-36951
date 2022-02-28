class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:quantity_id, :size_id, :post_code, :area, :city, :street, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

end
