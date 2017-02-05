class CustomerOrder < ActiveRecord::Base
    has_many :vine_orders, :dependent => :destroy
    
    accepts_nested_attributes_for :vine_orders, :allow_destroy => true, reject_if: :all_blank
    validates :address, presence: true
    validates :contact_person, presence: true
    validates :phone_number, presence: true
    validates :email_address, presence: true
    validates :year, presence: true
    validates :month, presence: true
    validates_presence_of :vine_orders
end