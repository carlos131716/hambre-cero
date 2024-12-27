class Menu < ApplicationRecord
    belongs_to :user
    has_many :menu_platos
    has_many :platos, through: :menu_platos
end