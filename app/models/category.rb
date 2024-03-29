class Category < ApplicationRecord
    validates :name, presence: true
    acts_as_paranoid
    acts_as_list

    has_many :products

    validates :name, presence: true

    default_scope { order(position: :asc)}
end
