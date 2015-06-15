class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
 	before_destroy :ensure_not_referenced_by_any_line_item


  has_attached_file :image, :styles => { 
  	:medium => "300x300#", 
  	:thumb => "100x100#" }, 
  	:default_url => "missing_product_:style.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  private
  	def referenced_by_line_item
  		if line_items.empty?
  			return true
			else
				errors.add(:base, 'Line items present')
				return false
  	end
  end
  
end
