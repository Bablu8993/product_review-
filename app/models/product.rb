class Product < ApplicationRecord
  belongs_to :category
  validates :product_name, presence: true
  validates :price, presence: true
  after_initialize :default_values

  private
    def default_values
      self.hitcount ||= 0
      self.user_count ||= 0
    end
end
