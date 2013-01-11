class Comment < ActiveRecord::Base
  attr_accessible :content, :customer_id, :parent_id, :product_id, :rating, :level
  belongs_to :customer
  belongs_to :product
  belongs_to :parent, class_name: "Comment", foreign_key: "parent_id"
  has_many :children, class_name: "Comment", foreign_key: "parent_id"

  validates_presence_of :content,
                        :customer_id,
                        :product_id,
                        :rating

  validates :rating, :numericality => { :greater_than => 0, :less_than_or_equal_to => 5 }

  before_save :set_level

  def has_parent?
    parent_id.any?
  end

  def has_no_parent?
    parent_id.nil?
  end

  def set_level
    self.level = count_levels_to_root(self)
  end

  private

  def count_levels_to_root(comment)
    if comment.has_no_parent?
      return 0
    else
      return 1+count_levels_to_root(comment.parent)
    end
  end
end