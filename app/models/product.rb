class Product < ApplicationRecord
  has_rich_text :description
  include CodeGenerator
  
  validates :name, presence: true
  validates :list_price, :sell_price, presence: :true, numericality: true, numericality: { greater_than: 0, allow_nil: true }
  validates :code, uniqueness: true
  
  
  has_many :skus
  belongs_to :vendor
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true
end
