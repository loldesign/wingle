# -------
# Creating first admin
# -------
if Admin.count == 0
  admin = Admin.new(email: 'suporte@loldesign.com.br', password: 'loldesign2018', password_confirmation: 'loldesign2018')

  puts "---> Admin [#{admin.email}] criado com sucesso" if admin.save
end


# -------
# Creating First Country/State/City/Default Locales
# -------
if Country.count == 0
  brasil   = Country.create(name: 'Brasil')
  sp_state = State.create(name: 'São Paulo', country: brasil)
  sp_city  = City.create(name: 'São Paulo', state: sp_state)

  Locale.create(name: 'Região Norte', city: sp_city)
  Locale.create(name: 'Região Sul'  , city: sp_city)
  Locale.create(name: 'Região Leste', city: sp_city)
  Locale.create(name: 'Região Oeste', city: sp_city)
  Locale.create(name: 'Centro'      , city: sp_city)
end