class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity, :image_url

  validates_presence_of :name, :description, :price, :quantity

  has_many :line_items
  has_many :comments

  def available?(amount = 1)
    return quantity >= amount
  end

  def average_rating
    sum = comments.sum(&:rating)
    if comments.count == 0
      return 0
    else
      return Float sum/comments.count
    end
  end
end