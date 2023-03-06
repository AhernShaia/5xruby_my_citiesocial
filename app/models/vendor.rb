class Vendor < ApplicationRecord
    acts_as_paranoid
    validates :title, presence: true

    scope :available, -> {where(online: true)}
    # Ex:- scope :active, -> {where(:active => true)}

    # def self.available
    # end
end
