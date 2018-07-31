# -------
# Creating first admin
# -------
if Admin.count == 0
  admin = Admin.new(email: 'suporte@loldesign.com.br', password: 'loldesign2018', password_confirmation: 'loldesign2018')

  puts "---> Admin [#{admin.email}] criado com sucesso" if admin.save
end
