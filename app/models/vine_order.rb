class VineOrder < ActiveRecord::Base
    belongs_to :customer_order
    
    validates :variety, presence: true
    validates :clone, presence: true
    validates :rootstock, presence: true
    validates :quantity, presence: true
    validate :clone_is_associated
    
    def clone_is_associated
        if !Vine.where(:name => variety).first.clones.exists?(Clone.where(:name => clone).first)
            errors.add(:clone, "Please select clones which belong to the selected varieties")
        end
    end
end