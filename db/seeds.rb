# db/seeds.rb

# Elimina todos los usuarios existentes (opcional)
User .destroy_all

# Crear un usuario administrador
User .create!(
  username: "admin_user",
  email: "admin@example.com",
  password: "password",
  role: User::ROLE_ADMIN
)

# Crear un donador
User .create!(
  username: "donor_user",
  email: "donor@example.com",
  password: "password",
  role: User::ROLE_DONADOR
)

# Crear un jefe de familia
User .create!(
  username: "family_head_user",
  email: "family_head@example.com",
  password: "password",
  role: User::ROLE_FAMILY_HEAD,
  apellido_familia: "Familia Pérez",
  numero_integrantes: 4
)

puts "Usuarios creados exitosamente."