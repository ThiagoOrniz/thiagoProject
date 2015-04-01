class Sale < ActiveRecord::Base
  belongs_to :client
  belongs_to :rep
  belongs_to :item
  
end
