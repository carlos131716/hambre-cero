# app/models/user.rb
class User < ApplicationRecord
    has_secure_password
  
    # Definición de constantes para los roles
    ROLE_ADMIN = 0
    ROLE_DONADOR = 1
    ROLE_FAMILY_HEAD = 2
  
    # Validaciones
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :role, presence: true, inclusion: { in: [ROLE_ADMIN, ROLE_DONADOR, ROLE_FAMILY_HEAD] }
  
    # Validaciones específicas para el jefe de familia
    validates :apellido_familia, presence: true, if: -> { role == ROLE_FAMILY_HEAD }
    validates :numero_integrantes, presence: true, if: -> { role == ROLE_FAMILY_HEAD }
    
    has_many :menus # Relación de uno a muchos con los menús
    # Métodos de conveniencia para obtener el nombre del rol
    def admin?
      role == ROLE_ADMIN
    end
  
    def donador?
      role == ROLE_DONADOR
    end
  
    def family_head?
      role == ROLE_FAMILY_HEAD
    end

    def max_platos_por_dia
      role == 2 ? numero_integrantes : 0
    end
end