class StorefrontController < ApplicationController
  def all_items
  	if params[:cat_id]
  		@category = Category.find(params[:cat_id])
  		@products = Product.where(category_id: params[:cat_id])
	else
  		@products = Product.all
  	end
  end
end
