class Movie < ActiveRecord::Base
	def to_param
		"#{id}-#{title}".parameterize
	end
	
	belongs_to :user
	
	validates :title, presence: true, length: {minimum: 3, maximum: 100}
	
	validates :image_url, presence: true, length: {minimum: 3, maximum: 150}
	
	validates :description, presence: true, length: {minimum: 3, maximum: 500}
	
	validates :length, presence: true, length: {minimum: 3, maximum: 10}
	
	validates :director, presence: true, length: {minimum: 3, maximum: 100}
	
	validates :rating, presence: true, numericality: { only_integer: true,
	greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
	
	#{ :only_integer => true, :greater_than_or_equal_to => 0,
	#:less_than_or_equal_to => 10}
end
