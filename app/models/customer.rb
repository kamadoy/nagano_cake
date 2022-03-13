class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



         has_many :cart_items, dependent: :destroy
         has_many :adresses, dependent: :destroy
         has_many :orders, dependent: :destroy


        with_options presence: true do
        validates :email
        validates :last_name
        validates :first_name
        validates :last_name_kana
        validates :first_name_kana
        validates :adress
        validates :postal_code
        validates :adress
        validates :telephone_number
  end
end
