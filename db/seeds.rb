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

# -------
# Creating First Sectors
# -------
if Sector.count == 0
  Sector.create(name: 'INDÚSTRIA PESADA', description: 'Metais e Mineração, Siderurgia, Construção Pesada, Máquinas e Bens de Capital')
  Sector.create(name: 'ENERGIA E RECURSOS NATURAIS', description: 'Óleo & Gás,Energias Renováveis,Combustíveis')
  Sector.create(name: 'INDÚSTRIA DE MANUFATURA', description: 'Automotiva, Aeronáutica, Naval, Ferroviária, Maquinas e Equipamentos')
  Sector.create(name: 'TRANSPORTE E LOGÍSTICA', description: 'Aéreo, Rodoviário, Marítimo, Ferroviário, Centros de Distribuição')
  Sector.create(name: 'CONSTRUÇÃO E INCORPORAÇÃO', description: 'Residencial, Comercial, Galpões Logísticos, Infraestrutura, Imobiliárias')
  Sector.create(name: 'INDÚSTRIA AGROPECUÁRIA', description: 'Frigoríficos, Tradings, Papel e Celulose, Commodities, Têxtil')
  Sector.create(name: 'INDÚSTRIA QUÍMICA', description: 'Agroquímicos, Petroquímicos, Tintas,Polímeros')
  Sector.create(name: 'INDÚSTRIA FARMACÊUTICA', description: 'Farmacêutica, Laboratórios')
  Sector.create(name: 'BENS DE CONSUMO', description: 'Higiene e Limpeza, Utilidades Domésticas, Eletro Eletrônicos, Alimentos e Bebidas, Vestuário')
  Sector.create(name: 'TI & TELECOM', description: 'Software, Hardware, Operadoras de Telefonia')
  Sector.create(name: 'INOVAÇÃO DIGITAL', description: 'E-Commerce, Marketplaces, Tech Companies, IOT, Wearable')
  Sector.create(name: 'MERCADO FINANCEIRO', description: 'Bancos, Seguradoras e Corretoras, Meios de Pagamento, Boutiques de Investimento, Serviços Financeiros')
  Sector.create(name: 'CONSULTORIAS', description: '')
  Sector.create(name: 'ESCRITÓRIOS JURÍDICOS', description: '')
  Sector.create(name: 'VAREJO & ATACADO', description: 'Mercados e Atacadistas, Shopping Center e Franquias, Varejistas, Equipamentos Domésticos, Mobília e Decoração')
  Sector.create(name: 'SERVIÇOS', description: 'Educação, Hospitais, Hotelaria e Turismo, Entretenimento, Saúde e Bem estar,etc')
  Sector.create(name: 'PUBLICADADE E PROPAGANDA', description: '')
  Sector.create(name: 'TERCEIRO SETOR', description: 'ONGs, Parceria Público Privadas, Iniciativa Privada sem fins lucrativos')
end

# -------
# Creating First Company Sizes
# -------
if CompanySize.count == 0
  CompanySize.create(name: 'INÍCIO DE OPERAÇÃO', description: 'maior autonomia, relevância e dinamismo')
  CompanySize.create(name: 'EMPRESA MÉDIA', description: 'oportunidade de crescimento e estruturação de processos')
  CompanySize.create(name: 'GRANDE CORPORAÇÃO', description: 'hierarquia, melhoria de processos e estabilidade')
end

# -------
# Creating First Modes
# -------
if Mode.count == 0
  Mode.create(name: 'AGRESSIVA', description: 'foco no curto prazo, números e performance')
  Mode.create(name: 'MODERADA', description: 'foco no médio prazo, negócio e pessoas')
  Mode.create(name: 'CONSERVADORA', description: 'foco no longo prazo, hierarquizada e tradicional')
end

# -------
# Creating First Relevances
# -------
if Relevance.count == 0
  Relevance.create(name: 'PORTE DA EMPRESA')
  Relevance.create(name: 'SETOR DE ATUAÇÃO')
  Relevance.create(name: 'LOCALIZAÇÃO')
end