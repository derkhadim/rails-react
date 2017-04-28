class Api::V1::ItemsController < Api::V1::BaseController

	def index
		respond_with Item.all
	end

	def create
		respond_with :api, :v1, Item.create(item_params)
	end

	def update
		item = Item.find(params["id"])
		item.update_attributes(item_params)
		respond_with item, json: item
	end

	def destroy
		respond_with Item.destroy(item_params)
	end

	private

	def item_params
		params.require(:item).permit(:id, :name, :description)
	end


end