class Plato < ApplicationRecord
    validates :name_comida, presence: true, uniqueness: true
    has_many :menu_platos
    has_many :menus, through: :menu_platos
end
