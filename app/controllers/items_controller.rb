class ItemsController < ApplicationController
def index
    @item = Item.all
end
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to @item
  end

  def edit
    @item = Item.find(params[:id])
  end

def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to @item
end

def destroy
    @item = Item.find(params[:id])
    @item.destroy
    # viewを持たないので消去の挙動は確認できない｡ページそのものが消去されているので､redirectが必要
    redirect_to items_url

end

  private
  def item_params
    params.require(:item).permit(
        :name, :description, :price,
        :email, :seller_id, :image_url
      )

  end


end

