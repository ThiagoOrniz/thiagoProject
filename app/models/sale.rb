class Sale < ActiveRecord::Base
  belongs_to :client
  belongs_to :rep
  has_many :items

  accepts_nested_attributes_for :items, :allow_destroy => true

  def update_price(items)
    items.each do |item|
      @product =Product.find(item.product_id)
      item.price = @product.price
    end 
  end

end
