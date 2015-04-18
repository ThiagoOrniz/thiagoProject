class Client < ActiveRecord::Base
	belongs_to :rep

	validates :name, presence: true, length: {minimum: 2}  	
  	validates :address, presence: true, length: { minimum: 5}
  	validates :phone, presence: true, numericality: { only_integer: true }
  	validates :email, presence: true
end
