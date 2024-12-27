class MenuPlato < ApplicationRecord
    belongs_to :menu
    belongs_to :plato
    validates :cantidad, numericality: { greater_than_or_equal_to: 1 }
end