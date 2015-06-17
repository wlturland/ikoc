class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order
  
  def total_price
   product.price * quantity
 end

end

# TODO Fix Cart Delete redirect to redirect to cart_id instead of line items table.

