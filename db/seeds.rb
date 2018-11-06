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
puts "---> Processing Countries ..."
if Country.count == 0
  brasil   = Country.create(name: 'Brasil')
  sp_state = State.create(name: 'São Paulo', country: brasil)
  sp_city  = City.create(name: 'São Paulo', state: sp_state)
else
  puts "---> No Countries afected..."
end

puts "---> Processing CountryLocale ..."
if CountryLocale.count == 0
  brasil   = Country.where(name: 'Brasil').first

  CountryLocale.create(name: 'Norte', country: brasil)
  CountryLocale.create(name: 'Nordeste', country: brasil)
  CountryLocale.create(name: 'Centro-Oeste', country: brasil)
  CountryLocale.create(name: 'Sudeste', country: brasil)
  CountryLocale.create(name: 'Sul', country: brasil)
else
  puts "---> No CountryLocale afected..."
end

puts "---> Processing CityLocale ..."
if CityLocale.count == 0
  sp = City.first

  CityLocale.create(name: 'Zona Sul'  , city: sp, priority: 0)
  CityLocale.create(name: 'Zona Oeste', city: sp, priority: 1)
  CityLocale.create(name: 'Centro'    , city: sp, priority: 2)
  CityLocale.create(name: 'Zona Norte', city: sp, priority: 3)
  CityLocale.create(name: 'Zona Leste', city: sp, priority: 4)
else
  puts "---> No CityLocale afected..."
end


puts "---> Processing Neighborhood ..."
# if after Oct 5, 2018 it may have 10 neighborhoods
sp = City.first
east   = CityLocale.find_by_name("Zona Leste")
west   = CityLocale.find_by_name("Zona Oeste")
south  = CityLocale.find_by_name("Zona Sul")
north  = CityLocale.find_by_name("Zona Norte")
center = CityLocale.find_by_name("Centro")

# setting priority for CityLocale
south.update_attributes(priority: 0, code: 'S')
west.update_attributes(priority: 1, code: 'O')
center.update_attributes(priority: 2, code: 'C')
north.update_attributes(priority: 3, code: 'N')
east.update_attributes(priority: 4, code: 'L')

# Create neighborhood groups
  # Center
  Neighborhood.find_or_create_by(name: 'Bela Vista, Liberdade, Aclimação e Cambuci', code: 'C1', city: sp, city_locale: center)
  Neighborhood.find_or_create_by(name: 'Consolação, Higienópolis, Santa Cecília'   , code: 'C2', city: sp, city_locale: center)
  Neighborhood.find_or_create_by(name: 'Sé e República e Bom Retiro'               , code: 'C3', city: sp, city_locale: center)

  # South
  Neighborhood.find_or_create_by(name: 'Itaim, Jardins e Paulista'                          , code: 'S1', city: sp, city_locale: south)
  Neighborhood.find_or_create_by(name: 'Berrini, Vila Olímpia, Brooklin, Campo Belo, Moema' , code: 'S2', city: sp, city_locale: south)
  Neighborhood.find_or_create_by(name: 'Vila Mariana, Saúde e Jabaquara'                    , code: 'S3', city: sp, city_locale: south)
  Neighborhood.find_or_create_by(name: 'Chác. Sto.Antonio, Sto Amaro, Socorro e Interlagos' , code: 'S4', city: sp, city_locale: south)
  Neighborhood.find_or_create_by(name: 'Morumbi, Cidade Jardim'                             , code: 'S5', city: sp, city_locale: south)
  Neighborhood.find_or_create_by(name: 'Ipiranga, Cursino e Sacomã'                         , code: 'S6', city: sp, city_locale: south)
  Neighborhood.find_or_create_by(name: 'ABC e região'                                       , code: 'S7', city: sp, city_locale: south)

  # West
  Neighborhood.find_or_create_by(name: 'Pinheiros, Alto de Pinheiros e Vila Madalena'           , code: 'O1', city: sp, city_locale: west)
  Neighborhood.find_or_create_by(name: 'Lapa, Barra Funda, Perdizes, Vila Leopoldina e Jaguaré' , code: 'O2', city: sp, city_locale: west)
  Neighborhood.find_or_create_by(name: 'Butantã, Vila Sônia e Raposo Tavares'                   , code: 'O3', city: sp, city_locale: west)
  Neighborhood.find_or_create_by(name: 'Osasco, Barueri, Alphaville e região'                   , code: 'O4', city: sp, city_locale: west)
  Neighborhood.find_or_create_by(name: 'Cotia, Embú, Taboão e região'                           , code: 'O5', city: sp, city_locale: west)

  # North
  Neighborhood.find_or_create_by(name: 'Santana, Casa Verde, Vila Guilherme e Vila Maria' , code: 'N1', city: sp, city_locale: north)
  Neighborhood.find_or_create_by(name: 'Freguesia do Ó e Brasilândia'                     , code: 'N2', city: sp, city_locale: north)
  Neighborhood.find_or_create_by(name: 'Pirituba, São Domingos e Jaraguá'                 , code: 'N3', city: sp, city_locale: north)
  Neighborhood.find_or_create_by(name: 'Guarulhos e região'                               , code: 'N4', city: sp, city_locale: north)

  # East
  Neighborhood.find_or_create_by(name: 'Móoca , Brás, Pari, Belém, Tatuapé e Agua Rasa' , code: 'L1', city: sp, city_locale: east)
  Neighborhood.find_or_create_by(name: 'Vila Prudente, São Lucas e Sapopemba'           , code: 'L2', city: sp, city_locale: east)
  Neighborhood.find_or_create_by(name: 'Carrão, Penha, Vila Formosa e Aricanduva'       , code: 'L3', city: sp, city_locale: east)
  Neighborhood.find_or_create_by(name: 'Artur Alvim, Itaquera, Cidade São Mateus'       , code: 'L4', city: sp, city_locale: east)

# Create new neighborhoods
# Center
# Neighborhood.find_or_create_by(name: 'Bela Vista', city: sp, city_locale: center)
# Neighborhood.find_or_create_by(name: 'Liberdade', city: sp, city_locale: center)
# Neighborhood.find_or_create_by(name: 'Aclimação', city: sp, city_locale: center)
# Neighborhood.find_or_create_by(name: 'Consolação', city: sp, city_locale: center)
# Neighborhood.find_or_create_by(name: 'Higienópolis', city: sp, city_locale: center)
# Neighborhood.find_or_create_by(name: 'Santa Cecília', city: sp, city_locale: center)
# Neighborhood.find_or_create_by(name: 'República', city: sp, city_locale: center)
# Neighborhood.find_or_create_by(name: 'Bom Retiro', city: sp, city_locale: center)
# # South
# Neighborhood.find_or_create_by(name: 'Jardins', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Paulista', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Berrini', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Vila Olímpia', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Brooklin', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Campo Belo', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Saúde', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Chác. Sto. Antônio', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Sto. Amaro', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Socorro', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Cidade Jardim', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Ipiranga', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Cursino', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'Sacomã', city: sp, city_locale: south)
# Neighborhood.find_or_create_by(name: 'ABC e região', city: sp, city_locale: south)
# # West
# Neighborhood.find_or_create_by(name: 'Pinheiros', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Alto de Pinheiros', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Vila Madalena', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Lapa', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Barra Funda', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Perdizes', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Vila Leopoldina', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Jaguaré', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Butantã', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Vila Sônia', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Raposo Tavares', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Osasco', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Barueri', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Alphaville e região', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Cotia', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Embú', city: sp, city_locale: west)
# Neighborhood.find_or_create_by(name: 'Taboão e região', city: sp, city_locale: west)
# # North
# Neighborhood.find_or_create_by(name: 'Santana', city: sp, city_locale: north)
# Neighborhood.find_or_create_by(name: 'Casa Verde', city: sp, city_locale: north)
# Neighborhood.find_or_create_by(name: 'Vila Guilherme', city: sp, city_locale: north)
# Neighborhood.find_or_create_by(name: 'Vila Maria', city: sp, city_locale: north)
# Neighborhood.find_or_create_by(name: 'Freguesia do Ó', city: sp, city_locale: north)
# Neighborhood.find_or_create_by(name: 'Brasilândia', city: sp, city_locale: north)
# Neighborhood.find_or_create_by(name: 'Pirituba', city: sp, city_locale: north)
# Neighborhood.find_or_create_by(name: 'São Domingos', city: sp, city_locale: north)
# Neighborhood.find_or_create_by(name: 'Jaraguá', city: sp, city_locale: north)
# Neighborhood.find_or_create_by(name: 'Guarulhos e região', city: sp, city_locale: north)
# # East
# Neighborhood.find_or_create_by(name: 'Brás', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Pari', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Belém', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Tatuapé', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Água Rasa', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Vila Prudente', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'São Lucas', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Carrão', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Penha', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Vila Formosa', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Aricanduva', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Artur Alvim', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Itaquera', city: sp, city_locale: east)
# Neighborhood.find_or_create_by(name: 'Cidade São Mateus', city: sp, city_locale: east)

# -------
# Creating First Sectors
# -------
puts "---> Processing Sectors ..."
Sector.find_or_create_by(name: 'INDÚSTRIA PESADA'           , code: 'S1', description: 'Metais e Mineração, Siderurgia, Construção Pesada, Máquinas e Bens de Capital')
Sector.find_or_create_by(name: 'ENERGIA E RECURSOS NATURAIS', code: 'S2', description: 'Óleo & Gás,Energias Renováveis,Combustíveis')
Sector.find_or_create_by(name: 'INDÚSTRIA DE MANUFATURA'    , code: 'S3', description: 'Automotiva, Aeronáutica, Naval, Ferroviária, Maquinas e Equipamentos')
Sector.find_or_create_by(name: 'TRANSPORTE E LOGÍSTICA'     , code: 'S4', description: 'Aéreo, Rodoviário, Marítimo, Ferroviário, Centros de Distribuição')
Sector.find_or_create_by(name: 'CONSTRUÇÃO E INCORPORAÇÃO'  , code: 'S5', description: 'Residencial, Comercial, Galpões Logísticos, Infraestrutura, Imobiliárias')
Sector.find_or_create_by(name: 'INDÚSTRIA AGROPECUÁRIA'     , code: 'S6', description: 'Frigoríficos, Tradings, Papel e Celulose, Commodities, Têxtil')
Sector.find_or_create_by(name: 'INDÚSTRIA QUÍMICA'          , code: 'S7', description: 'Agroquímicos, Petroquímicos, Tintas,Polímeros')
Sector.find_or_create_by(name: 'INDÚSTRIA FARMACÊUTICA'     , code: 'S8', description: 'Farmacêutica, Laboratórios')
Sector.find_or_create_by(name: 'BENS DE CONSUMO'            , code: 'S9', description: 'Higiene e Limpeza, Utilidades Domésticas, Eletro Eletrônicos, Alimentos e Bebidas, Vestuário')
Sector.find_or_create_by(name: 'TI & TELECOM'               , code: 'S10', description: 'Software, Hardware, Operadoras de Telefonia')
Sector.find_or_create_by(name: 'INOVAÇÃO DIGITAL'           , code: 'S11', description: 'E-Commerce, Marketplaces, Tech Companies, IOT, Wearable')
Sector.find_or_create_by(name: 'MERCADO FINANCEIRO'         , code: 'S12', description: 'Bancos, Seguradoras e Corretoras, Meios de Pagamento, Boutiques de Investimento, Serviços Financeiros')
Sector.find_or_create_by(name: 'CONSULTORIAS'               , code: 'S13', description: '')
Sector.find_or_create_by(name: 'ESCRITÓRIOS JURÍDICOS'      , code: 'S14', description: '')
Sector.find_or_create_by(name: 'VAREJO & ATACADO'           , code: 'S15', description: 'Mercados e Atacadistas, Shopping Center e Franquias, Varejistas, Equipamentos Domésticos, Mobília e Decoração')
Sector.find_or_create_by(name: 'SERVIÇOS'                   , code: 'S16', description: 'Educação, Hospitais, Hotelaria e Turismo, Entretenimento, Saúde e Bem estar,etc')
Sector.find_or_create_by(name: 'PUBLICADADE E PROPAGANDA'   , code: 'S17', description: '')
Sector.find_or_create_by(name: 'TERCEIRO SETOR'             , code: 'S18', description: 'ONGs, Parceria Público Privadas, Iniciativa Privada sem fins lucrativos')

# -------
# Creating First Company Sizes
# -------
puts "---> Processing CompanySizes ..."
CompanySize.find_or_create_by(name: 'INÍCIO DE OPERAÇÃO', code: 'C1', description: 'maior autonomia, relevância e dinamismo')
CompanySize.find_or_create_by(name: 'EMPRESA MÉDIA'     , code: 'C2', description: 'oportunidade de crescimento e estruturação de processos')
CompanySize.find_or_create_by(name: 'GRANDE CORPORAÇÃO' , code: 'C3', description: 'hierarquia, melhoria de processos e estabilidade')

# -------
# Creating First Modes
# -------
puts "---> Processing Modes ..."
Mode.find_or_create_by(name: 'AGRESSIVA'      , code: 'Amd',  description: 'foco no curto prazo, números e performance')
Mode.find_or_create_by(name: 'MODERADA'       , code: 'Md',   description: 'foco no médio prazo, negócio e pessoas')
Mode.find_or_create_by(name: 'CONSERVADORA'   , code: 'Cmd',  description: 'foco no longo prazo, hierarquizada e tradicional')

# -------
# Creating First Relevances
# -------
puts "---> Processing Relevances ..."
Relevance.find_or_create_by(name: 'PORTE DA EMPRESA', priority: 3)
Relevance.find_or_create_by(name: 'SETOR DE ATUAÇÃO', priority: 2)
Relevance.find_or_create_by(name: 'LOCALIZAÇÃO', priority: 1)

# -------
# Creating First Areas, Functions and Habilities
# -------
  puts "---> Processing Areas, Functions and Habilities ..."
  # AREAS 01
  area_01 = Area.find_or_create_by(name: 'VENDAS')

  function_01 = Function.find_or_create_by(name: 'B2B - Engenheiro de Vendas', area: area_01)
  Hability.find_or_create_by(name: 'Fornecer suporte técnico de vendas', function: function_01)
  Hability.find_or_create_by(name: 'Desenvolver produtos ou soluções competitivas', function: function_01)
  Hability.find_or_create_by(name: 'Auxiliar no atingimento das metas de vendas', function: function_01)
  Hability.find_or_create_by(name: 'Explicar questões técnicas sobre produtos', function: function_01)
  Hability.find_or_create_by(name: 'Estruturar propostas comerciais', function: function_01)
  Hability.find_or_create_by(name: 'Suportar atividades de pré-venda', function: function_01)
  Hability.find_or_create_by(name: 'Analisar especificações do cliente', function: function_01)
  Hability.find_or_create_by(name: 'Manter relacionamento com clientes', function: function_01)

  function_02 = Function.find_or_create_by(name: 'B2B - Pré-vendas', area: area_01)
  Hability.find_or_create_by(name: 'Explicar aspectos técnicos ', function: function_02)
  Hability.find_or_create_by(name: 'Estruturar propostas', function: function_02)
  Hability.find_or_create_by(name: 'Realizar cotações', function: function_02)
  Hability.find_or_create_by(name: 'Visitar clientes', function: function_02)
  Hability.find_or_create_by(name: 'Oferecer ideas para novas soluções', function: function_02)
  Hability.find_or_create_by(name: 'Garantir a execução de produtos ou serviços', function: function_02)
  Hability.find_or_create_by(name: 'Verificar novas oportunidades em clientes recorrentes', function: function_02)

  function_03 = Function.find_or_create_by(name: 'B2B - Vendas Corporativas', area: area_01)
  Hability.find_or_create_by(name: 'Identificar empresas no mercado', function: function_03)
  Hability.find_or_create_by(name: 'Agendar visitas de prospecção e relacionamento', function: function_03)
  Hability.find_or_create_by(name: 'Entender o problema do cliente', function: function_03)
  Hability.find_or_create_by(name: 'Apresentar soluções de produtos ou serviços', function: function_03)
  Hability.find_or_create_by(name: 'Atender metas de atividade comercial', function: function_03)
  Hability.find_or_create_by(name: 'Representar a empresa em eventos corporativos', function: function_03)
  Hability.find_or_create_by(name: 'Lidar com objeções ', function: function_03)
  Hability.find_or_create_by(name: 'Negociar e fechar negócios com empresas', function: function_03)
  Hability.find_or_create_by(name: 'Captar novos clientes', function: function_03)
  Hability.find_or_create_by(name: 'Fazer relacionamento com clientes recorrentes', function: function_03)
  Hability.find_or_create_by(name: 'Resgatar clientes antigos', function: function_03)

  function_04 = Function.find_or_create_by(name: 'B2B - Contas Estratégicas', area: area_01)
  Hability.find_or_create_by(name: 'Fidelizar portifolio de clientes', function: function_04)
  Hability.find_or_create_by(name: 'Entender as necessidades dos clientes', function: function_04)
  Hability.find_or_create_by(name: 'Expandir o leque de soluções por cliente', function: function_04)
  Hability.find_or_create_by(name: 'Garantir que produtos e serviços sejam executados no prazo', function: function_04)
  Hability.find_or_create_by(name: 'Facilitar a comunicação entre clientes e equipes internas', function: function_04)
  Hability.find_or_create_by(name: 'Lidar com reclamações e oferecer soluções', function: function_04)
  Hability.find_or_create_by(name: 'Preparar relatórios com métricas das contas', function: function_04)

  function_05 = Function.find_or_create_by(name: 'B2B - Desenvolvimento de Negócios', area: area_01)
  Hability.find_or_create_by(name: 'Desenvolver estratégias e planos de crescimento', function: function_05)
  Hability.find_or_create_by(name: 'Trabalhar ações de retenção para clientes existentes', function: function_05)
  Hability.find_or_create_by(name: 'Aumentar base de clientes', function: function_05)
  Hability.find_or_create_by(name: 'Trasmitir a proposta de valor do s produtos e serviços', function: function_05)
  Hability.find_or_create_by(name: 'Negociar com partes interessadas', function: function_05)
  Hability.find_or_create_by(name: 'Mapear necessidades e tendências de mercado', function: function_05)
  Hability.find_or_create_by(name: 'Elaborar e revisar contratos', function: function_05)
  Hability.find_or_create_by(name: 'Identificar oportunidades para ações e campanhas', function: function_05)

  function_06 = Function.find_or_create_by(name: 'B2B - Canais e Alianças', area: area_01)
  Hability.find_or_create_by(name: 'Desenvolver parceiros de canal em territórios', function: function_06)
  Hability.find_or_create_by(name: 'Gerenciar receitas de vendas por região', function: function_06)
  Hability.find_or_create_by(name: 'Executar plano de negócios para atingimento de metas', function: function_06)
  Hability.find_or_create_by(name: 'Analisar tendências do mercado', function: function_06)
  Hability.find_or_create_by(name: 'Desenvolver planos de venda', function: function_06)
  Hability.find_or_create_by(name: 'Educar parceiros sobre portifolio de produtos ou serviços', function: function_06)
  Hability.find_or_create_by(name: 'Resolver problemas relacionados a parceiros', function: function_06)
  Hability.find_or_create_by(name: 'Suportar parceiros com iniciativas de marketing local', function: function_06)

  function_07 = Function.find_or_create_by(name: 'B2B - Expansão de Rede ', area: area_01)
  Hability.find_or_create_by(name: 'Coloborar com a estratégia da expansão da rede', function: function_07)
  Hability.find_or_create_by(name: 'Participar de feiras e eventos', function: function_07)
  Hability.find_or_create_by(name: 'Prospecção de novos franqueados', function: function_07)
  Hability.find_or_create_by(name: 'Triagem e entrevista de franqueados', function: function_07)
  Hability.find_or_create_by(name: 'Apresentação do modelo de franquia', function: function_07)
  Hability.find_or_create_by(name: 'Negociação e fechamento', function: function_07)
  Hability.find_or_create_by(name: 'Sugerir localização das unidades', function: function_07)

  function_08 = Function.find_or_create_by(name: 'B2C - Distribuição para Varejo', area: area_01)
  Hability.find_or_create_by(name: 'Fornececer informações do produto ou serviço', function: function_08)
  Hability.find_or_create_by(name: 'Realizar comparações de preço ', function: function_08)
  Hability.find_or_create_by(name: 'Assegurar prateiras cheias nos pontos de venda', function: function_08)
  Hability.find_or_create_by(name: 'Gerenciar devoluções de mercadorias', function: function_08)
  Hability.find_or_create_by(name: 'Informar clientes sobre descontos e ofertas', function: function_08)
  Hability.find_or_create_by(name: 'Responder pergunta dos clientes sobre produtos', function: function_08)

  function_09 = Function.find_or_create_by(name: 'B2C - Venda Direta ', area: area_01)
  Hability.find_or_create_by(name: 'Visitar potenciais consumidores', function: function_09)
  Hability.find_or_create_by(name: 'Apresentar produtos ou serviços', function: function_09)
  Hability.find_or_create_by(name: 'Esclarecer dúvidas ', function: function_09)
  Hability.find_or_create_by(name: 'Executar pedidos de compra', function: function_09)
  Hability.find_or_create_by(name: 'Negociar preços', function: function_09)
  Hability.find_or_create_by(name: 'Falar com matriz e filiais', function: function_09)
  Hability.find_or_create_by(name: 'Emitir propostas comerciais', function: function_09)
  Hability.find_or_create_by(name: 'Manter cadastros atualizados', function: function_09)
  Hability.find_or_create_by(name: 'Elaborar relatórios de vendas', function: function_09)

  function_10 = Function.find_or_create_by(name: 'Call Center', area: area_01)
  Hability.find_or_create_by(name: 'Analisar métricas de atendimento ao cliente', function: function_10)
  Hability.find_or_create_by(name: 'Dimensionar a equipe de atendimento', function: function_10)
  Hability.find_or_create_by(name: 'Gerir e treinar a equipe de atendimento', function: function_10)
  Hability.find_or_create_by(name: 'Controlar despesas', function: function_10)
  Hability.find_or_create_by(name: 'Preparar relatórios gerenciais', function: function_10)
  Hability.find_or_create_by(name: 'Experiência com call center ativo', function: function_10)
  Hability.find_or_create_by(name: 'Experiência com call center receptivo', function: function_10)
  Hability.find_or_create_by(name: 'Resolver problemas críticos de atendimento', function: function_10)

  # AREA 02
  area_02 = Area.find_or_create_by(name: 'Marketing & Comunicação')

  function_12 = Function.find_or_create_by(name: 'Inovação', area: area_02)
  Hability.find_or_create_by(name: 'Criação de novos produtos ou serviços', function: function_12)
  Hability.find_or_create_by(name: 'Desenvolvimento de protótipos', function: function_12)
  Hability.find_or_create_by(name: 'Análise de tendências de mercado', function: function_12)
  Hability.find_or_create_by(name: 'Estratégia de inovação', function: function_12)
  Hability.find_or_create_by(name: 'Envolvimento com áreas chave', function: function_12)
  Hability.find_or_create_by(name: 'Projetos Nacionais', function: function_12)
  Hability.find_or_create_by(name: 'Projetos Internacionais', function: function_12)
  Hability.find_or_create_by(name: 'Envolvimento com alta gestão', function: function_12)
  Hability.find_or_create_by(name: 'Novas patentes', function: function_12)
  Hability.find_or_create_by(name: 'Gestão de KPIs', function: function_12)
  Hability.find_or_create_by(name: 'Foco em B2B', function: function_12)
  Hability.find_or_create_by(name: 'Foco em B2C', function: function_12)
  Hability.find_or_create_by(name: 'Foco em C2C', function: function_12)

  function_13 = Function.find_or_create_by(name: 'Marca & Branding', area: area_02)
  Hability.find_or_create_by(name: 'Analisar como a marca está posicionada no mercado', function: function_13)
  Hability.find_or_create_by(name: 'Concretizar a visão, missão e objetivos da marca', function: function_13)
  Hability.find_or_create_by(name: 'Definir planos de marca e estratégias de mercado', function: function_13)
  Hability.find_or_create_by(name: 'Liderar o engajamento interno', function: function_13)
  Hability.find_or_create_by(name: 'Medir o desempenho e o retorno de campanhas (ROI e KPIs)', function: function_13)
  Hability.find_or_create_by(name: 'Treinar a equipe', function: function_13)
  Hability.find_or_create_by(name: 'Supervisionar marketing e publicidade para garantir fidelidade', function: function_13)
  Hability.find_or_create_by(name: 'Monitorar distribuição do produto e reação do consumidor', function: function_13)
  Hability.find_or_create_by(name: 'Alinhar a empresa em torno da direção, escolha e táticas da marca', function: function_13)
  Hability.find_or_create_by(name: 'Foco em B2B', function: function_13)
  Hability.find_or_create_by(name: 'Foco em B2C', function: function_13)
  Hability.find_or_create_by(name: 'Foco em C2C', function: function_13)

  function_14 = Function.find_or_create_by(name: 'Produto & Categoria', area: area_02)
  Hability.find_or_create_by(name: 'Visão e estratégia do produto', function: function_14)
  Hability.find_or_create_by(name: 'Acompanhar as revisões de categoria de varejo', function: function_14)
  Hability.find_or_create_by(name: 'Executar programas promocionais', function: function_14)
  Hability.find_or_create_by(name: 'Melhorar a rentabilidade dos programas', function: function_14)
  Hability.find_or_create_by(name: 'Contribuir com o lançamento de novos itens', function: function_14)
  Hability.find_or_create_by(name: 'Análise de inventário e ciclo de produtos', function: function_14)
  Hability.find_or_create_by(name: 'Colaboração entre estoque e planejamento de vendas', function: function_14)

  function_15 = Function.find_or_create_by(name: 'Trade Marketing', area: area_02)
  Hability.find_or_create_by(name: 'Desenvolver e criar programas', function: function_15)
  Hability.find_or_create_by(name: 'Contribuir para atingir metas de vendas', function: function_15)
  Hability.find_or_create_by(name: 'Melhorar a participação no mercado', function: function_15)
  Hability.find_or_create_by(name: 'Estabelecer estratégias com envolvidos', function: function_15)
  Hability.find_or_create_by(name: 'Preparar plano promocional', function: function_15)
  Hability.find_or_create_by(name: 'Estabelecer a estratégia de marketing no ponto de vendas', function: function_15)
  Hability.find_or_create_by(name: 'Verificar oportunidade de negócios', function: function_15)
  Hability.find_or_create_by(name: 'Liderar equipe de promotores', function: function_15)

  function_16 = Function.find_or_create_by(name: 'Planejamento Estratégico (FIN)', area: area_02)
  Hability.find_or_create_by(name: 'Modelar a estratégia e missão da empresa', function: function_16)
  Hability.find_or_create_by(name: 'Desenvolver planos de negócio', function: function_16)
  Hability.find_or_create_by(name: 'Avaliar ameaças e oportunidades', function: function_16)
  Hability.find_or_create_by(name: 'Analisar desempenho operacional da empresa', function: function_16)
  Hability.find_or_create_by(name: 'Alinhar recursos e metas de departamento com estratégia geral', function: function_16)
  Hability.find_or_create_by(name: 'Suportar mudanças organizacionais', function: function_16)
  Hability.find_or_create_by(name: 'Orientar liderança na tomada de decisões eficazes', function: function_16)
  Hability.find_or_create_by(name: 'Monitorar tendências do setor e mudanças do mercado', function: function_16)
  Hability.find_or_create_by(name: 'Foco em B2B', function: function_16)
  Hability.find_or_create_by(name: 'Foco em B2C', function: function_16)
  Hability.find_or_create_by(name: 'Foco em C2C', function: function_16)

  function_17 = Function.find_or_create_by(name: 'Inteligência de mercado (TI?)', area: area_02)
  Hability.find_or_create_by(name: 'Preparar budget e alocação de recursos', function: function_17)
  Hability.find_or_create_by(name: 'Realizar pesquisas de mercado', function: function_17)
  Hability.find_or_create_by(name: 'Determinar oportunidades e tendências', function: function_17)
  Hability.find_or_create_by(name: 'Avaliar ameaças no mercado', function: function_17)
  Hability.find_or_create_by(name: 'Fornecer informações para o planejamento estratégico', function: function_17)
  Hability.find_or_create_by(name: 'Revisar a segmentação de clientes', function: function_17)
  Hability.find_or_create_by(name: 'Analisar informações de mercado por amostra', function: function_17)
  Hability.find_or_create_by(name: 'Monitorar análises e métricas para o negócio', function: function_17)
  Hability.find_or_create_by(name: 'Relatórios gerenteciais', function: function_17)
  Hability.find_or_create_by(name: 'Foco em B2B', function: function_17)
  Hability.find_or_create_by(name: 'Foco em B2C', function: function_17)
  Hability.find_or_create_by(name: 'Foco em C2C', function: function_17)

  function_18 = Function.find_or_create_by(name: 'Marketing e Comunicação', area: area_02)
  Hability.find_or_create_by(name: 'Criar planos para aumentar participação no mercado', function: function_18)
  Hability.find_or_create_by(name: 'Realizar e analisar pesquisas de mercado', function: function_18)
  Hability.find_or_create_by(name: 'Desenvolver estratégias de precificação', function: function_18)
  Hability.find_or_create_by(name: 'Produzir materiais promocionais e conteúdo para suporte', function: function_18)
  Hability.find_or_create_by(name: 'Relacionamento com parceiros de agências', function: function_18)
  Hability.find_or_create_by(name: 'Criar apresentações de marketing', function: function_18)
  Hability.find_or_create_by(name: 'Desenvolver cronogramas com ações', function: function_18)
  Hability.find_or_create_by(name: 'Realizar eventos com clientes', function: function_18)
  Hability.find_or_create_by(name: 'Medir performance de campanhas', function: function_18)
  Hability.find_or_create_by(name: 'Produzir conteúdo para Blog e Website', function: function_18)
  Hability.find_or_create_by(name: 'Criar e promover campanhas', function: function_18)
  Hability.find_or_create_by(name: 'Foco em B2B', function: function_18)
  Hability.find_or_create_by(name: 'Foco em B2C', function: function_18)
  Hability.find_or_create_by(name: 'Foco em C2C', function: function_18)

  function_19 = Function.find_or_create_by(name: 'Relações Públicas', area: area_02)
  Hability.find_or_create_by(name: 'Responsabilidade Social', function: function_19)
  Hability.find_or_create_by(name: 'Produzir  press releases', function: function_19)
  Hability.find_or_create_by(name: 'Lidar com perguntas do público', function: function_19)
  Hability.find_or_create_by(name: 'Participar de conferências de imprensa', function: function_19)
  Hability.find_or_create_by(name: 'Analisar cobertura da mídia', function: function_19)
  Hability.find_or_create_by(name: 'Realizar pesquisa de mercado', function: function_19)
  Hability.find_or_create_by(name: 'Zelar pea imagem da empresa', function: function_19)
  Hability.find_or_create_by(name: 'Proteger a imagem de executivos', function: function_19)

  function_20 = Function.find_or_create_by(name: 'Media Planner', area: area_02)
  Hability.find_or_create_by(name: 'Trabalhar o funil de vendas', function: function_20)
  Hability.find_or_create_by(name: 'Realização de pesquisas', function: function_20)
  Hability.find_or_create_by(name: 'Análise de dados de clientes', function: function_20)
  Hability.find_or_create_by(name: 'Relacioanmento com fornecedores', function: function_20)
  Hability.find_or_create_by(name: 'Gerenciamento de mídias Sociais', function: function_20)
  Hability.find_or_create_by(name: 'Campanhas na TV, Rádio e Internet', function: function_20)
  Hability.find_or_create_by(name: 'Criação de campanhas e conteúdo', function: function_20)
  Hability.find_or_create_by(name: 'Elaboração do desing gráfico', function: function_20)
  Hability.find_or_create_by(name: 'Foco em B2B', function: function_20)
  Hability.find_or_create_by(name: 'Foco em B2C', function: function_20)
  Hability.find_or_create_by(name: 'Foco em C2C', function: function_20)

  function_20 = Function.find_or_create_by(name: 'Eventos', area: area_02)
  Hability.find_or_create_by(name: 'Organização de eventos', function: function_20)
  Hability.find_or_create_by(name: 'Controle do orçamento', function: function_20)
  Hability.find_or_create_by(name: 'Avaliação de fornecedores', function: function_20)
  Hability.find_or_create_by(name: 'Acompanhar montagem e desmontagem', function: function_20)
  Hability.find_or_create_by(name: 'Organizar logística dos participantes', function: function_20)
  Hability.find_or_create_by(name: 'Foco em B2B', function: function_20)
  Hability.find_or_create_by(name: 'Foco em B2C', function: function_20)
  Hability.find_or_create_by(name: 'Foco em C2C', function: function_20)

  function_21 = Function.find_or_create_by(name: 'Customer Service', area: area_02)
  Hability.find_or_create_by(name: 'Resolver problemas de clientes', function: function_21)
  Hability.find_or_create_by(name: 'Determinar a causa do problema', function: function_21)
  Hability.find_or_create_by(name: 'Garantir a resolução', function: function_21)
  Hability.find_or_create_by(name: 'Preparar relatórios de acompanhamento', function: function_21)
  Hability.find_or_create_by(name: 'Avaliar as necessidades dos clientes para alcançar a satisfação', function: function_21)
  Hability.find_or_create_by(name: 'Resolver reclamações de clientes via telefone, email, email ou mídias sociais', function: function_21)
  Hability.find_or_create_by(name: 'Foco no produto', function: function_21)
  Hability.find_or_create_by(name: 'Foco em serviços', function: function_21)

  function_22 = Function.find_or_create_by(name: 'Digital Marketing', area: area_02)
  Hability.find_or_create_by(name: 'Planejar e executar todo marketing digital', function: function_22)
  Hability.find_or_create_by(name: 'Gerenciar mídias sociais', function: function_22)
  Hability.find_or_create_by(name: 'Revisar SEO e SEM', function: function_22)
  Hability.find_or_create_by(name: 'Avaliar indicadores e realizar análises', function: function_22)
  Hability.find_or_create_by(name: 'Controlar orçamento e entender ROI', function: function_22)
  Hability.find_or_create_by(name: 'Colaborar com agências e terceiros', function: function_22)
  Hability.find_or_create_by(name: 'Produzir e divulgar conteúdo', function: function_22)
  Hability.find_or_create_by(name: 'Captar leads de potenciais clientes', function: function_22)

  function_23 = Function.find_or_create_by(name: 'CRM', area: area_02)
  Hability.find_or_create_by(name: 'Estratégia de retenção e fidelização de clientes', function: function_23)
  Hability.find_or_create_by(name: 'Estruturar funil de vendas', function: function_23)
  Hability.find_or_create_by(name: 'Segmentar o banco de dados corretamente', function: function_23)
  Hability.find_or_create_by(name: 'Definir a estratégia em conjunto com outras áreas', function: function_23)
  Hability.find_or_create_by(name: 'Medir e analisar resultados', function: function_23)
  Hability.find_or_create_by(name: 'Propor abordagens mais eficientes', function: function_23)
  Hability.find_or_create_by(name: 'Lidar com fornecedores', function: function_23)
  Hability.find_or_create_by(name: 'Foco em B2B', function: function_23)
  Hability.find_or_create_by(name: 'Foco em B2C', function: function_23)
  Hability.find_or_create_by(name: 'Foco em C2C', function: function_23)

  function_24 = Function.find_or_create_by(name: 'Revenue & Pricing', area: area_02)
  Hability.find_or_create_by(name: 'Avaliação das estratégias de preço', function: function_24)
  Hability.find_or_create_by(name: 'Posicionamento de marca', function: function_24)
  Hability.find_or_create_by(name: 'Análise da concorrência', function: function_24)
  Hability.find_or_create_by(name: 'Tendências de mercado', function: function_24)
  Hability.find_or_create_by(name: 'Custo de Produção', function: function_24)
  Hability.find_or_create_by(name: 'Análise de margem', function: function_24)
  Hability.find_or_create_by(name: 'Relatórios gerenciais', function: function_24)
  Hability.find_or_create_by(name: 'Cadastro de precos e descontos', function: function_24)
  Hability.find_or_create_by(name: 'Definição de promoções', function: function_24)
  Hability.find_or_create_by(name: 'Foco em B2B', function: function_24)
  Hability.find_or_create_by(name: 'Foco em B2C', function: function_24)
  Hability.find_or_create_by(name: 'Foco em C2C', function: function_24)

  # AREA 03
  area_03 = Area.find_or_create_by(name: 'Suprimentos, Compras & Logística')

  function_25 = Function.find_or_create_by(name: 'Comércio Exterior', area: area_03)
  Hability.find_or_create_by(name: 'Importação', function: function_25)
  Hability.find_or_create_by(name: 'Exportação', function: function_25)
  Hability.find_or_create_by(name: 'Importação e Exportação', function: function_25)
  Hability.find_or_create_by(name: 'Tranporte Áereo ', function: function_25)
  Hability.find_or_create_by(name: 'Transporte Marítimo', function: function_25)
  Hability.find_or_create_by(name: 'Transporte Rodoviário', function: function_25)
  Hability.find_or_create_by(name: 'Transporte Ferroviário', function: function_25)
  Hability.find_or_create_by(name: 'Desembaraço aduaneiro', function: function_25)
  Hability.find_or_create_by(name: 'América do Norte', function: function_25)
  Hability.find_or_create_by(name: 'América Latina', function: function_25)
  Hability.find_or_create_by(name: 'Europa', function: function_25)
  Hability.find_or_create_by(name: 'Ásia', function: function_25)
  Hability.find_or_create_by(name: 'África', function: function_25)
  Hability.find_or_create_by(name: 'Oceania', function: function_25)

  function_26 = Function.find_or_create_by(name: 'Logística, PCP e Estoque', area: area_03)
  Hability.find_or_create_by(name: 'Gerenciamento estratégico da logística', function: function_26)
  Hability.find_or_create_by(name: 'Priorização de pedidos para clientes', function: function_26)
  Hability.find_or_create_by(name: 'Analisar KPIs de fornecedores', function: function_26)
  Hability.find_or_create_by(name: 'Planejamento e controle da produção', function: function_26)
  Hability.find_or_create_by(name: 'Gerenciamento do estoque', function: function_26)
  Hability.find_or_create_by(name: 'Analisar política de sortimento', function: function_26)
  Hability.find_or_create_by(name: 'Catalogar mercadorias, planejar rotas e processar remessas', function: function_26)
  Hability.find_or_create_by(name: 'Realizar a gestão da frota', function: function_26)

  function_27 = Function.find_or_create_by(name: 'Compras', area: area_03)
  Hability.find_or_create_by(name: 'Desenvolver estratégia de compras', function: function_27)
  Hability.find_or_create_by(name: 'Acompanhar métricas e reduzir despezas', function: function_27)
  Hability.find_or_create_by(name: 'Realizar previsão de preço e tendência de mercado', function: function_27)
  Hability.find_or_create_by(name: 'Realizar análise de custos, cenários e benchmarking', function: function_27)
  Hability.find_or_create_by(name: 'Relacionamento com fornecedores estratégicos', function: function_27)
  Hability.find_or_create_by(name: 'Desenvolvimento de novos fornecedores', function: function_27)
  Hability.find_or_create_by(name: 'Avaliar, gerenciar e mitigar riscos', function: function_27)
  Hability.find_or_create_by(name: 'Compra de matéria prima', function: function_27)
  Hability.find_or_create_by(name: 'Compra de equipamentos', function: function_27)
  Hability.find_or_create_by(name: 'Compra de serviços', function: function_27)
  Hability.find_or_create_by(name: 'Compra de mercadorias', function: function_27)
  Hability.find_or_create_by(name: 'Compras de material de escritório', function: function_27)
  Hability.find_or_create_by(name: 'Atuação nacional', function: function_27)
  Hability.find_or_create_by(name: 'Atuação internacional', function: function_27)

  function_28 = Function.find_or_create_by(name: 'Supply Chain', area: area_03)
  Hability.find_or_create_by(name: 'Planejar e implementar a estratégia geral da cadeia de suprimentos', function: function_28)
  Hability.find_or_create_by(name: 'Colaborar com equipes de vendas, operações e atendimento ao cliente', function: function_28)
  Hability.find_or_create_by(name: 'Determinar principais KPIs da cadeia de fornecimento', function: function_28)
  Hability.find_or_create_by(name: 'Sugerir solulções para melhorias de processo', function: function_28)
  Hability.find_or_create_by(name: 'Identificar gargalos e implementar soluções', function: function_28)
  Hability.find_or_create_by(name: 'Trabalhar com vendas e finanças na escolha de fornecedores', function: function_28)
  Hability.find_or_create_by(name: 'Atuação nacional', function: function_28)
  Hability.find_or_create_by(name: 'Atuação internacional', function: function_28)

  # AREA 04
  area_04 = Area.find_or_create_by(name: 'Engenharia & Produção')

  function_29 = Function.create(name: 'Operações', area: area_04)
  Hability.find_or_create_by(name: 'Entregar a produção nas metas estabelecidas', function: function_29)
  Hability.find_or_create_by(name: 'Melhorar sistemas operacionais continuamente', function: function_29)
  Hability.find_or_create_by(name: 'Programar a necessidade de insumos produtivos', function: function_29)
  Hability.find_or_create_by(name: 'Avaliar e melhorar KPIs de produção', function: function_29)
  Hability.find_or_create_by(name: 'Realizar controle de qualidade', function: function_29)
  Hability.find_or_create_by(name: 'Alocar recursos de forma eficaz', function: function_29)
  Hability.find_or_create_by(name: 'Analisar dados para reduzir disperdício', function: function_29)
  Hability.find_or_create_by(name: 'Gerenciar turnos e horas extras', function: function_29)
  Hability.find_or_create_by(name: 'Abordar questões ou queixas de funcionários', function: function_29)
  Hability.find_or_create_by(name: 'Administrar acordos coletivos de trabalho', function: function_29)

  function_30 = Function.find_or_create_by(name: 'Saúde, Segurança e Meior Ambiente', area: area_04)
  Hability.find_or_create_by(name: 'Desenvolver programas de treinamento de segurança ', function: function_30)
  Hability.find_or_create_by(name: 'Manter os regulamentos de segurança em conformidade', function: function_30)
  Hability.find_or_create_by(name: 'Inspecionar todos os equipamentos de proteção', function: function_30)
  Hability.find_or_create_by(name: 'Supervisionar e gerenciar todos os resíduos perigosos', function: function_30)
  Hability.find_or_create_by(name: 'Avaliar todas as licenças ambientais necessárias', function: function_30)
  Hability.find_or_create_by(name: 'Recomendar melhorias para os sistemas de gestão da qualidade', function: function_30)
  Hability.find_or_create_by(name: 'Implementar soluções em situações emergenciais', function: function_30)
  Hability.find_or_create_by(name: 'Atender todas as políticas de órgãos reguladores', function: function_30)
  Hability.find_or_create_by(name: 'Recomendar estratégias para redução de acidentes', function: function_30)
  Hability.find_or_create_by(name: 'Monitorar programas de proteção e conservação', function: function_30)

  function_31 = Function.find_or_create_by(name: 'Produção & Processos', area: area_04)
  Hability.find_or_create_by(name: 'Planejar e coordenar processos de engenharia de produção', function: function_31)
  Hability.find_or_create_by(name: 'Produzir produtos que atendam padrões de qualidade', function: function_31)
  Hability.find_or_create_by(name: 'Desenvolver melhorias de processos', function: function_31)
  Hability.find_or_create_by(name: 'Desenvolver estratégias operacionais para atingir metas financeiras', function: function_31)
  Hability.find_or_create_by(name: 'Desenvolver estratégias para atingir metas de produção', function: function_31)
  Hability.find_or_create_by(name: 'Identificar operações e práticas inseguras', function: function_31)
  Hability.find_or_create_by(name: 'Realizar análises para reduzir tempo de inativadade e interrupções', function: function_31)
  Hability.find_or_create_by(name: 'Implementar iniciativas de redução de custos', function: function_31)
  Hability.find_or_create_by(name: 'Fornecer treinamento e orientação para membros da equipe', function: function_31)
  Hability.find_or_create_by(name: 'Compartilhar melhores práticas', function: function_31)
  Hability.find_or_create_by(name: 'Auxiliar na preparação do orçamento e monitorar despesas', function: function_31)

  function_32 = Function.find_or_create_by(name: 'Desenvolvimento de Produtos', area: area_04)
  Hability.find_or_create_by(name: 'Desenvolver  protótipos de projetos', function: function_32)
  Hability.find_or_create_by(name: 'Realizar testes e avaliar funcionalidades', function: function_32)
  Hability.find_or_create_by(name: 'Analisar novos componentes, materiais e tecnologias', function: function_32)
  Hability.find_or_create_by(name: 'Coordenar equipes multidisciplinares', function: function_32)
  Hability.find_or_create_by(name: 'Promover iniciativas contínuas de melhorias de produtos', function: function_32)
  Hability.find_or_create_by(name: 'Elaborar cronogramas para implementação efetiva de projetos', function: function_32)
  Hability.find_or_create_by(name: 'Calcular o custo do produto', function: function_32)
  Hability.find_or_create_by(name: 'Atender questões regulatórias internas e externas', function: function_32)
  Hability.find_or_create_by(name: 'Aprovar protótipos que atendam critérios de qualidade da empresa', function: function_32)
  Hability.find_or_create_by(name: 'Desenvolver ou selecionar equipamentos para a execução de testes', function: function_32)
  Hability.find_or_create_by(name: 'Registrar e documentar os resultados', function: function_32)

  function_33 = Function.find_or_create_by(name: 'Manutenção e Facilities', area: area_04)
  Hability.find_or_create_by(name: 'Realizar manutenção preditiva e preventiva', function: function_33)
  Hability.find_or_create_by(name: 'Inspecionar instalações para verificar e resolver problemas', function: function_33)
  Hability.find_or_create_by(name: 'Verificar sistemas elétricos e hidráulicos', function: function_33)
  Hability.find_or_create_by(name: 'Supervisionar atividades de reparo e instalação', function: function_33)
  Hability.find_or_create_by(name: 'Monitorar o estoque de equipamentos', function: function_33)
  Hability.find_or_create_by(name: 'Lidar com serviços terceirizados', function: function_33)
  Hability.find_or_create_by(name: 'Monitorar despesas e controle do orçamento', function: function_33)
  Hability.find_or_create_by(name: 'Manter registros de manutenção e relatar atividades', function: function_33)
  Hability.find_or_create_by(name: 'Garantir que as políticas de saúde e segurança sejam cumpridas', function: function_33)

  function_34 = Function.find_or_create_by(name: 'Controle e Automação', area: area_04)
  Hability.find_or_create_by(name: 'Gerir processos eletromecânicos', function: function_34)
  Hability.find_or_create_by(name: 'Supervisionar processos de controles computacionais para fabricação', function: function_34)
  Hability.find_or_create_by(name: 'Integrar sistemas elétricos e mecânicos na manutafura', function: function_34)
  Hability.find_or_create_by(name: 'Realizar testes e documentar sistemas eletromecânicos', function: function_34)
  Hability.find_or_create_by(name: 'Fabricar novos equipamentos para produção', function: function_34)
  Hability.find_or_create_by(name: 'Desenvolver soluções de produção para novas linhas de produtos', function: function_34)
  Hability.find_or_create_by(name: 'Testar e validar dispositivos', function: function_34)
  Hability.find_or_create_by(name: 'Prototipar dispositivos mecatrônicos', function: function_34)
  Hability.find_or_create_by(name: 'Projetar motores, solenóides, sensores, circuito impresso', function: function_34)

  function_35 = Function.find_or_create_by(name: 'Eletricista ou Eletrônico', area: area_04)
  Hability.find_or_create_by(name: 'Desenvolver circuitos e dispositivos', function: function_35)
  Hability.find_or_create_by(name: 'Realizar melhorias em equipamentos eletrônicos', function: function_35)
  Hability.find_or_create_by(name: 'Garantir o funcionamento do produto', function: function_35)
  Hability.find_or_create_by(name: 'Projetar módulos eletrônicos customizados', function: function_35)
  Hability.find_or_create_by(name: 'Elaborar manuais de instruções do procedimento de teste', function: function_35)
  Hability.find_or_create_by(name: 'Revisar e validar projetos', function: function_35)
  Hability.find_or_create_by(name: 'Resolver e mitigar problemas eletrônicos', function: function_35)

  function_36 = Function.find_or_create_by(name: 'Mecânico', area: area_04)
  Hability.find_or_create_by(name: 'Desenvolver produtos', function: function_36)
  Hability.find_or_create_by(name: 'Projetar sistemas e componentes', function: function_36)
  Hability.find_or_create_by(name: 'Realizar testes e analisar resultados', function: function_36)
  Hability.find_or_create_by(name: 'Avaliar a qualidade do produto final', function: function_36)
  Hability.find_or_create_by(name: 'Elaborar orçamento e escopo de projetos', function: function_36)
  Hability.find_or_create_by(name: 'Preparar relatórios e documentação do produto', function: function_36)
  Hability.find_or_create_by(name: 'Desenvolver novas teorias ou métodos', function: function_36)
  Hability.find_or_create_by(name: 'Projetar e construir ferramentas', function: function_36)
  Hability.find_or_create_by(name: 'Projetar e construir máquinas', function: function_36)

  function_37 = Function.find_or_create_by(name: 'Químico', area: area_04)
  Hability.find_or_create_by(name: 'Analisar responsabilidade sócio ambiental em novos produtos', function: function_37)
  Hability.find_or_create_by(name: 'Otimizar processos industriais', function: function_37)
  Hability.find_or_create_by(name: 'Solucionar problemas de qualidade e segurança', function: function_37)
  Hability.find_or_create_by(name: 'Investigar problemas operacionais', function: function_37)
  Hability.find_or_create_by(name: 'Verificar segurança dos equipamentos', function: function_37)
  Hability.find_or_create_by(name: 'Projetar plantas químicas', function: function_37)
  Hability.find_or_create_by(name: 'Corrigir gargalos de processo', function: function_37)
  Hability.find_or_create_by(name: 'Lidar com fornecedores e serviços terceirizados', function: function_37)
  Hability.find_or_create_by(name: 'Coordenar pesquisas de desenvolvimento', function: function_37)
  Hability.find_or_create_by(name: 'Identificar oportunidades de redução de custo', function: function_37)

  function_38 = Function.find_or_create_by(name: 'Aplicação', area: area_04)
  Hability.find_or_create_by(name: 'Suportar clientes em soluções de produtos', function: function_38)
  Hability.find_or_create_by(name: 'Fornecer suporte pós-venda aos clientes', function: function_38)
  Hability.find_or_create_by(name: 'Realizar testes para qualificação do produto', function: function_38)
  Hability.find_or_create_by(name: 'Propor melhorias no produto', function: function_38)
  Hability.find_or_create_by(name: 'Coloborar com departamentos de vendas e marketing', function: function_38)
  Hability.find_or_create_by(name: 'Manter documentações sobre soluções de problemas', function: function_38)

  function_39 = Function.find_or_create_by(name: 'Alimentos', area: area_04)
  Hability.find_or_create_by(name: 'Qualificação dos insumos', function: function_39)
  Hability.find_or_create_by(name: 'Desenvolvimento de embralagens', function: function_39)
  Hability.find_or_create_by(name: 'Criar produtos alimentícios', function: function_39)
  Hability.find_or_create_by(name: 'Controlar qualidade dos produtos', function: function_39)
  Hability.find_or_create_by(name: 'Melhorar processos produtivos', function: function_39)
  Hability.find_or_create_by(name: 'Melhorar produtos existentes', function: function_39)
  Hability.find_or_create_by(name: 'Reduzir custos produtivos', function: function_39)

  function_40 = Function.find_or_create_by(name: 'Gerenciamento de Projetos', area: area_04)
  Hability.find_or_create_by(name: 'Garantir projetos dentro do prazo e escopo', function: function_40)
  Hability.find_or_create_by(name: 'Disponibilizar e alocar recursos internos e terceiros', function: function_40)
  Hability.find_or_create_by(name: 'Gerenciar o orçamento do projeto', function: function_40)
  Hability.find_or_create_by(name: 'Allinhar partes interessadas para garantir viabilidade técnica', function: function_40)
  Hability.find_or_create_by(name: 'Acompanhar custos e orçamento do projeto', function: function_40)
  Hability.find_or_create_by(name: 'Medir desempenho do projeto por métricas', function: function_40)
  Hability.find_or_create_by(name: 'Minimizar riscos ao projeto', function: function_40)
  Hability.find_or_create_by(name: 'Documentar plano e atividades', function: function_40)

  # AREA 05
  area_05 = Area.find_or_create_by(name: 'Finanças & Tributário')

  function_41 = Function.find_or_create_by(name: 'Crédito & Cobrança', area: area_05)
  Hability.find_or_create_by(name: 'Monitorar contas para identificar dívidas pendentes', function: function_41)
  Hability.find_or_create_by(name: 'Investigar dados históricos para cada dívida ou fatura', function: function_41)
  Hability.find_or_create_by(name: 'Entrar em contato com clientes para perguntar sobre pagamentos atrasados', function: function_41)
  Hability.find_or_create_by(name: 'Tomar ações para o pagamento da dívida', function: function_41)
  Hability.find_or_create_by(name: 'Processar pagamentos e reembolsos', function: function_41)
  Hability.find_or_create_by(name: 'Resolver problemas de faturamento e crédito ao cliente', function: function_41)
  Hability.find_or_create_by(name: 'Atualizar relatórios de cobrança e situação do contas a receber', function: function_41)

  function_42 = Function.find_or_create_by(name: 'Tributário', area: area_05)
  Hability.find_or_create_by(name: 'Executar rotinas fiscais em acordo com a legislação', function: function_42)
  Hability.find_or_create_by(name: 'Estruturar o planejamento tributário', function: function_42)
  Hability.find_or_create_by(name: 'Analisar operações tributárias complexas', function: function_42)
  Hability.find_or_create_by(name: 'Identificar e reduzir riscos fiscais', function: function_42)
  Hability.find_or_create_by(name: 'Gerenciar provisão fiscal e o processo de conformidade fiscal', function: function_42)
  Hability.find_or_create_by(name: 'Suportar auditorias fiscais', function: function_42)
  Hability.find_or_create_by(name: 'Suportar a conciliação contábil', function: function_42)
  Hability.find_or_create_by(name: 'Responsabilidade por tributos diretos', function: function_42)
  Hability.find_or_create_by(name: 'Resposabilidade por tributos indiretos', function: function_42)

  function_43 = Function.find_or_create_by(name: 'Controller & Controladoria', area: area_05)
  Hability.find_or_create_by(name: 'Autação Regional', function: function_43)
  Hability.find_or_create_by(name: 'Atuação em Planta Fabril', function: function_43)
  Hability.find_or_create_by(name: 'Atuação em Unidade de Negócio', function: function_43)
  Hability.find_or_create_by(name: 'Gerenciar operações contábeis', function: function_43)
  Hability.find_or_create_by(name: 'Gerenciar operações de tesouraria', function: function_43)
  Hability.find_or_create_by(name: 'Gerenciar contabilidde de custos', function: function_43)
  Hability.find_or_create_by(name: 'Gerenciar contabilidade de estoque', function: function_43)
  Hability.find_or_create_by(name: 'Reconhecimento de receitas', function: function_43)
  Hability.find_or_create_by(name: 'Dirigir a preparação do orçamento', function: function_43)
  Hability.find_or_create_by(name: 'Relatar variações entre real e orçado', function: function_43)
  Hability.find_or_create_by(name: 'Preparar relatórios para demonstrações financeiras', function: function_43)
  Hability.find_or_create_by(name: 'Cumprir exigências de relatórios do governo e declarações fiscais', function: function_43)
  Hability.find_or_create_by(name: 'Fortalecer controles internos', function: function_43)
  Hability.find_or_create_by(name: 'Conhecimento em USGAAP', function: function_43)
  Hability.find_or_create_by(name: 'Conhecimento em IFRS', function: function_43)

  function_44 = Function.find_or_create_by(name: 'Contabilidade', area: area_05)
  Hability.find_or_create_by(name: "Gerenciar funções contábeis", function: function_44)
  Hability.find_or_create_by(name: "Desenvolver relatórios contábeis", function: function_44)
  Hability.find_or_create_by(name: "Realizar a reconcilização de contas", function: function_44)
  Hability.find_or_create_by(name: "Monitorar contas a pagar, receber, e outros registros", function: function_44)
  Hability.find_or_create_by(name: "Criar ferramentas de gerenciamento para monitorar processos contábeis", function: function_44)
  Hability.find_or_create_by(name: "Auxiliar na preparação do balanço e orçamento", function: function_44)
  Hability.find_or_create_by(name: "Acompanhar orçamentos para departamentos, projetos e concessões", function: function_44)
  Hability.find_or_create_by(name: "Gerenciar o fechamento contábil", function: function_44)
  Hability.find_or_create_by(name: "Realizar consolidação de balanços", function: function_44)
  Hability.find_or_create_by(name: "Atualizar o balanço patrimonial", function: function_44)
  Hability.find_or_create_by(name: "Suportar auditoria interna", function: function_44)

  function_45 = Function.find_or_create_by(name: 'Administrativo Financeiro', area: area_05)
  Hability.find_or_create_by(name: "Gerenciar atividades administrativas para atingir metas financeiras", function: function_45)
  Hability.find_or_create_by(name: "Desenvolver cronograma e orçamento para projetos financeiros", function: function_45)
  Hability.find_or_create_by(name: "Monitarar as despesas do orçamento alocado", function: function_45)
  Hability.find_or_create_by(name: "Desenvolver e manter procedimentos administrativos", function: function_45)
  Hability.find_or_create_by(name: "Contribuir na preparação do plano de negócios e orçamento operacional", function: function_45)
  Hability.find_or_create_by(name: "Revisar faturas e realizar pagamentos ", function: function_45)
  Hability.find_or_create_by(name: "Analisar discrepâncias contábeis e recomendar ações corretivas", function: function_45)
  Hability.find_or_create_by(name: "Implementar políticas contábeis padrão", function: function_45)
  Hability.find_or_create_by(name: "Manutenção dos registros financeiros", function: function_45)
  Hability.find_or_create_by(name: "Preparação de todos os relatórios financeiros", function: function_45)
  Hability.find_or_create_by(name: "Gerenciar processamento de folha de pagamento e declaração de impostos", function: function_45)

  function_46 = Function.find_or_create_by(name: 'Tesouraria', area: area_05)
  Hability.find_or_create_by(name: "Analisar propostas de serviços bancários e financeiros", function: function_46)
  Hability.find_or_create_by(name: "Fornecer posição de caixa diária, estimativa e análise", function: function_46)
  Hability.find_or_create_by(name: "Apresentar caixa mensal para confeção de relatórios contábeis", function: function_46)
  Hability.find_or_create_by(name: "Gerenciar cartão corportativo e reembolsos para despesas", function: function_46)
  Hability.find_or_create_by(name: "Gerenciar linhas de crédiito, cartas de crédito e garantias corporativas", function: function_46)
  Hability.find_or_create_by(name: "Auxiliar departamentos fiscais e jurídicos e, transações ", function: function_46)
  Hability.find_or_create_by(name: "Desenvolver, monitorar e atualizar o orçamento do departamento", function: function_46)
  Hability.find_or_create_by(name: "Gerenciar contas a pagar e contas a receber", function: function_46)
  Hability.find_or_create_by(name: "Captar linhas de crédito", function: function_46)
  Hability.find_or_create_by(name: "Obter financiamento para importação e exportação", function: function_46)
  Hability.find_or_create_by(name: "Gerenciar operações com câmbio", function: function_46)
  Hability.find_or_create_by(name: "Gerenciar operações com commodities", function: function_46)
  Hability.find_or_create_by(name: "Gerenciar operações com renda variável", function: function_46)
  Hability.find_or_create_by(name: "Gerenciar operações com derivativos", function: function_46)

  function_47 = Function.find_or_create_by(name: 'Novos Negócios', area: area_05)
  Hability.find_or_create_by(name: "Realizar modelagem fianceira", function: function_47)
  Hability.find_or_create_by(name: "Verificar Due Diligence de riscos", function: function_47)
  Hability.find_or_create_by(name: "Visualizar oportunidades no mercado", function: function_47)
  Hability.find_or_create_by(name: "Suporte para decisões estratégicas da empresa", function: function_47)
  Hability.find_or_create_by(name: "Análise de ativos e recursos passivos", function: function_47)
  Hability.find_or_create_by(name: "Relacionamento com bancos", function: function_47)
  Hability.find_or_create_by(name: "Relacionamento com consultorias estratégicas", function: function_47)
  Hability.find_or_create_by(name: "Estruturação de Financimento com bancos", function: function_47)
  Hability.find_or_create_by(name: "Experiência com Fusões e Aquisições", function: function_47)

  function_48 = Function.find_or_create_by(name: 'Planejamento Financeiro', area: area_05)
  Hability.find_or_create_by(name: "Analisar receita, custo, despesas e ganhos de capital", function: function_48)
  Hability.find_or_create_by(name: "Monitorar indicadores de desempenho", function: function_48)
  Hability.find_or_create_by(name: "Analisar tendências e variação inesperada", function: function_48)
  Hability.find_or_create_by(name: "Gerenciar ferramentas de orçamento, previsão e plano operacional", function: function_48)
  Hability.find_or_create_by(name: "Atualizar relatórios financeiros trimestrais e mensais", function: function_48)
  Hability.find_or_create_by(name: "Avaliar eficiência de processos", function: function_48)
  Hability.find_or_create_by(name: "Entender o ROI de produtos ou serviços", function: function_48)
  Hability.find_or_create_by(name: "Desenvolver modelos financeiros para apoiar iniciativas estratégicas", function: function_48)
  Hability.find_or_create_by(name: "Apoiar líderes de departamentos com análises detalhadas", function: function_48)
  Hability.find_or_create_by(name: "Preparar apresentações para o conselho de administração", function: function_48)

  function_49 = Function.find_or_create_by(name: 'Planejamento Estratégico (MKT)', area: area_05)
  Hability.find_or_create_by(name: "Modelar a estratégia e missão da empresa", function: function_49)
  Hability.find_or_create_by(name: "Desenvolver planos de negócio", function: function_49)
  Hability.find_or_create_by(name: "Avaliar ameaças e oportunidades", function: function_49)
  Hability.find_or_create_by(name: "Analisar desempenho operacional da empresa", function: function_49)
  Hability.find_or_create_by(name: "Alinhar recursos e metas de departamento com estratégia geral", function: function_49)
  Hability.find_or_create_by(name: "Suportar mudanças organizacionais", function: function_49)
  Hability.find_or_create_by(name: "Orientar liderança na tomada de decisões eficazes", function: function_49)
  Hability.find_or_create_by(name: "Monitorar tendências do setor e mudanças do mercado", function: function_49)
  Hability.find_or_create_by(name: "Foco em B2B", function: function_49)
  Hability.find_or_create_by(name: "Foco em B2C", function: function_49)
  Hability.find_or_create_by(name: "Foco em C2C", function: function_49)

  # AREA 06
  area_06 = Area.find_or_create_by(name: 'Auditoria, Compliance & Governança')

  # FUNCOES AREA 06
  function_50 = Function.find_or_create_by(name: 'Auditoria Contábil & SOX', area: area_06)
  Hability.find_or_create_by(name: "Planejar e agendar programas de auditoria", function: function_50)
  Hability.find_or_create_by(name: "Rever e avaliar a conclusão das auditorias", function: function_50)
  Hability.find_or_create_by(name: "Analisar dados financeiros, registros, relatórios e declarações", function: function_50)
  Hability.find_or_create_by(name: "Manter e atualizar banco de dados financeiros incluindo descobertas de auditoria", function: function_50)
  Hability.find_or_create_by(name: "Relatar itens de não conformidade", function: function_50)
  Hability.find_or_create_by(name: "Experiência com consultoria externa", function: function_50)
  Hability.find_or_create_by(name: "Experiência com consultoria interna", function: function_50)
  Hability.find_or_create_by(name: "Auditoria com foco em Bancos", function: function_50)
  Hability.find_or_create_by(name: "Auditoria com foco em Seguradoras", function: function_50)
  Hability.find_or_create_by(name: "Auditoria com foco na Indústria", function: function_50)
  Hability.find_or_create_by(name: "Auditoria com foco no setor de Serviços", function: function_50)
  Hability.find_or_create_by(name: "Auditoria de Inventário", function: function_50)

  function_51 = Function.find_or_create_by(name: 'Auditoria de Sistemas de TI', area: area_06)
  Hability.find_or_create_by(name: "Desenvolver um programa de auditoria de Sistemas na organização", function: function_51)
  Hability.find_or_create_by(name: "Analisar riscos associados aos processos de TI", function: function_51)
  Hability.find_or_create_by(name: "Avaliar eficácia dos sistemas de controle interno", function: function_51)
  Hability.find_or_create_by(name: "Estabelecer procedimentos e políticas padrão para auditoria de TI", function: function_51)
  Hability.find_or_create_by(name: "Recomendar ações para itens em não conformidade", function: function_51)
  Hability.find_or_create_by(name: "Experiência com consultoria externa", function: function_51)
  Hability.find_or_create_by(name: "Experiência com consultoria interna", function: function_51)
  Hability.find_or_create_by(name: "Auditoria com foco em Bancos", function: function_51)
  Hability.find_or_create_by(name: "Auditoria com foco em Seguradoras", function: function_51)
  Hability.find_or_create_by(name: "Auditoria com foco na Indústria", function: function_51)
  Hability.find_or_create_by(name: "Auditoria com foco no setor de Serviços", function: function_51)
  Hability.find_or_create_by(name: "Auditoria de Inventário", function: function_51)

  function_52 = Function.find_or_create_by(name: 'Compliance', area: area_06)
  Hability.find_or_create_by(name: "Verificar se diretrizes legais e políticas internas estão sendo cumpridas", function: function_52)
  Hability.find_or_create_by(name: "Avaliar e melhorar a eficiência dos controles", function: function_52)
  Hability.find_or_create_by(name: "Revisar procedimentos e relatórios para mitigar riscos de não conformidade", function: function_52)
  Hability.find_or_create_by(name: "Elaborar, modificar e implementar políticas na empresa", function: function_52)
  Hability.find_or_create_by(name: "Colaborar com conselhos corporativos", function: function_52)
  Hability.find_or_create_by(name: "Preparar relatórios para a liderança e órgãos reguladores externos", function: function_52)
  Hability.find_or_create_by(name: "Atuação com foco em Bancos", function: function_52)
  Hability.find_or_create_by(name: "Atuação com foco em Seguradoras", function: function_52)
  Hability.find_or_create_by(name: "Atuação com foco na Indústria", function: function_52)
  Hability.find_or_create_by(name: "Atuação com foco no setor de Serviços", function: function_52)

  function_53 = Function.find_or_create_by(name: 'Risco Operacional', area: area_06)
  Hability.find_or_create_by(name: "Desenvolver políticas para gerenciamento de riscos operacionais", function: function_53)
  Hability.find_or_create_by(name: "Avaliar riscos operacionais nas unidades de negócios", function: function_53)
  Hability.find_or_create_by(name: "Implementar plano estratégico para previnir, eliminar e mitigar riscos operacionais", function: function_53)
  Hability.find_or_create_by(name: "Definir principais indicadores de risco e controle", function: function_53)
  Hability.find_or_create_by(name: "Investigar causas fundamentais dos riscos operacionais", function: function_53)
  Hability.find_or_create_by(name: "Realizar o mapeamento de riscos", function: function_53)
  Hability.find_or_create_by(name: "Atuação com foco em Bancos", function: function_53)
  Hability.find_or_create_by(name: "Atuação com foco em Seguradoras", function: function_53)
  Hability.find_or_create_by(name: "Atuação com foco na Indústria", function: function_53)
  Hability.find_or_create_by(name: "Atuação com foco no setor de Serviços", function: function_53)

  function_54 = Function.find_or_create_by(name: 'Relacionamento com Investidores', area: area_06)
  Hability.find_or_create_by(name: "Implementar e gerenciar programas de relações com investidores", function: function_54)
  Hability.find_or_create_by(name: "Relacionamento com analistas, investidores e partes interessadas", function: function_54)
  Hability.find_or_create_by(name: "Responder ao questionamento de investidores com respostas corporativas", function: function_54)
  Hability.find_or_create_by(name: "Desenvolver o conteúdo para a apresentação de resultados trimestrais", function: function_54)
  Hability.find_or_create_by(name: "Preparar comunicados à imprensa sobre ganhos trimestrais", function: function_54)
  Hability.find_or_create_by(name: "Comunicar investidores sobre conquiestas e planos da companhia", function: function_54)
  Hability.find_or_create_by(name: "Realizar reuniões presenciais com investidores", function: function_54)

  function_55 = Function.find_or_create_by(name: 'Relações Governamentais', area: area_06)
  Hability.find_or_create_by(name: "Realizar pesqujsas e monitorar a legislação", function: function_55)
  Hability.find_or_create_by(name: "Analisar acontecimentos no governo que podem impactar a organização", function: function_55)
  Hability.find_or_create_by(name: "Pesquisar políticas para ver vantagens e desvantagens no futuro", function: function_55)
  Hability.find_or_create_by(name: "Comunicação interna para liderança da empresa", function: function_55)
  Hability.find_or_create_by(name: "Representação da organização em fóruns ou eventos do setor", function: function_55)
  Hability.find_or_create_by(name: "Reunião com parlamentares para discussão de leis para o setor", function: function_55)
  Hability.find_or_create_by(name: "Relacionamento com a imprensa", function: function_55)

  # AREA 07
  area_07 = Area.find_or_create_by(name: 'Recursos Humanos')

  # FUNCOES AREA 07
  function_56 = Function.find_or_create_by(name: 'Recrutamento e Seleção', area: area_07)
  Hability.find_or_create_by(name: "Contratar posições operacionais", function: function_56)
  Hability.find_or_create_by(name: "Contratar posições de média gerência", function: function_56)
  Hability.find_or_create_by(name: "Contratar posições de altos executivos", function: function_56)
  Hability.find_or_create_by(name: "Relacionamento com consultorias", function: function_56)
  Hability.find_or_create_by(name: "Entrevista por competências", function: function_56)
  Hability.find_or_create_by(name: "Recrutamento interno", function: function_56)
  Hability.find_or_create_by(name: "Recrutamento externo", function: function_56)
  Hability.find_or_create_by(name: "Na área de Finanças & Tributário", function: function_56)
  Hability.find_or_create_by(name: "Na área de Engenharia & Produção", function: function_56)
  Hability.find_or_create_by(name: "Na área de Tecnologia", function: function_56)
  Hability.find_or_create_by(name: "Na área de Vendas & Marketing", function: function_56)
  Hability.find_or_create_by(name: "Na área de Suprimentos, Compras e Logística", function: function_56)
  Hability.find_or_create_by(name: "Na área Jurídica", function: function_56)
  Hability.find_or_create_by(name: "Na área de Recursos Humanos", function: function_56)
  Hability.find_or_create_by(name: "Na área de Mercado Financeiro", function: function_56)

  function_57 = Function.find_or_create_by(name: 'Business Partner', area: area_07)
  Hability.find_or_create_by(name: "Apoiar linha de negócio com questões de RH", function: function_57)
  Hability.find_or_create_by(name: "Analisar tendências e métricas com foco em pessoas", function: function_57)
  Hability.find_or_create_by(name: "Atender reclamações de funcionários", function: function_57)
  Hability.find_or_create_by(name: "Resolver problemas complexos de relacionamento", function: function_57)
  Hability.find_or_create_by(name: "Propor iniciativas para aumentar a produtividade e retenção", function: function_57)
  Hability.find_or_create_by(name: "Fornecer orientação da política de RH", function: function_57)
  Hability.find_or_create_by(name: "Monitorar o planejamento da força de trabalho e sucessão", function: function_57)
  Hability.find_or_create_by(name: "Identificar necessidade de treinamento de indivíduos e equipes", function: function_57)
  Hability.find_or_create_by(name: "Avaliar programas de treinamento", function: function_57)
  Hability.find_or_create_by(name: "Sugeri estratégias para o RH", function: function_57)

  function_58 = Function.find_or_create_by(name: 'Treinamento & Desenvolvimento', area: area_07)
  Hability.find_or_create_by(name: "Estruturar e suportar a avaliação de desempenho dos funcionários", function: function_58)
  Hability.find_or_create_by(name: "Identificar necessidade de treinamento com linha de negócio", function: function_58)
  Hability.find_or_create_by(name: "Desenhar planos de treinamento individual, por equipe, ou geral ", function: function_58)
  Hability.find_or_create_by(name: "Implantar uma ampla variedade de treinamentos", function: function_58)
  Hability.find_or_create_by(name: "Realizar seções efetivas de coaching e orientação", function: function_58)
  Hability.find_or_create_by(name: "Monitorar a eficácia, sucesso e o ROI do programa de treinamento", function: function_58)
  Hability.find_or_create_by(name: "Reunir e compartilhar melhores práticas", function: function_58)
  Hability.find_or_create_by(name: "Estar atualizado com as tendências de treinamento ", function: function_58)
  Hability.find_or_create_by(name: "Gerenciar o orçamento de treinamento", function: function_58)

  function_59 = Function.find_or_create_by(name: 'Remuneração e Benefícios', area: area_07)
  Hability.find_or_create_by(name: "Desenvolver uma política de remuneração consistente com a cultura de trabalho", function: function_59)
  Hability.find_or_create_by(name: "Garantir que as práticas de remuneração estejam em acordo com a legislação", function: function_59)
  Hability.find_or_create_by(name: "Tomar decisões baseadas em dados e metodologia", function: function_59)
  Hability.find_or_create_by(name: "Estruturar remunerações indiretas financeiras, e não financeiras diretas", function: function_59)
  Hability.find_or_create_by(name: "Realizar pesquisas motivacionais para entender alternativas", function: function_59)
  Hability.find_or_create_by(name: "Estruturar cargos e salários, assim como descrições, avaliações e classificações de trabalho", function: function_59)
  Hability.find_or_create_by(name: "Participar de pesquisas salariais de mercado para comparar salários e benefícios vigentes", function: function_59)
  Hability.find_or_create_by(name: "Estruturar e revisar benefícios", function: function_59)

  function_60 = Function.find_or_create_by(name: 'Administração de Pessoal', area: area_07)
  Hability.find_or_create_by(name: "Processar transações da conta da folha de pagamento", function: function_60)
  Hability.find_or_create_by(name: "Coordenar apontamento de horas na folha", function: function_60)
  Hability.find_or_create_by(name: "Analisar alterações na folha de pagamento por novas contratações, recisões e aumentos", function: function_60)
  Hability.find_or_create_by(name: "Garantir conformidade com leis e políticas internas relevantes", function: function_60)
  Hability.find_or_create_by(name: "Suportar auditorias fiscais da folha de pagamento", function: function_60)
  Hability.find_or_create_by(name: "Manter registros atualizados", function: function_60)
  Hability.find_or_create_by(name: "Preparar relatórios", function: function_60)

  # AREA 08
  area_08 = Area.find_or_create_by(name: 'Administrativo & Suporte de escritório')

  # FUNCOES AREA 08
  function_61 = Function.find_or_create_by(name: 'Administrativo', area: area_08)
  Hability.find_or_create_by(name: "Coordenar sistemas administrativos", function: function_61)
  Hability.find_or_create_by(name: "Planejar maneiras de  simplificar processos", function: function_61)
  Hability.find_or_create_by(name: "Organizar o Lay Out do escritório", function: function_61)
  Hability.find_or_create_by(name: "Suportar áreas de negócio com relatórios", function: function_61)
  Hability.find_or_create_by(name: "Gerenciar cronogramas e prazos", function: function_61)
  Hability.find_or_create_by(name: "Monitorar estoque e mateiral de escritório", function: function_61)
  Hability.find_or_create_by(name: "Monitorar custos e despesas administrativas", function: function_61)
  Hability.find_or_create_by(name: "Supervisionar serviços de instalações  e manutenções", function: function_61)
  Hability.find_or_create_by(name: "Organizar eventos", function: function_61)
  Hability.find_or_create_by(name: "Atualizar organograma e informações", function: function_61)
  Hability.find_or_create_by(name: "Atender políticas e regulamentos locais", function: function_61)

  function_62 = Function.find_or_create_by(name: 'Secretariado', area: area_08)
  Hability.find_or_create_by(name: "Gerenciar agenda diária, semanal e mensal", function: function_62)
  Hability.find_or_create_by(name: "Organizar reuniões e compromissos", function: function_62)
  Hability.find_or_create_by(name: "Preparar e divulgar correspondências, formulários e memorando", function: function_62)
  Hability.find_or_create_by(name: "Arquivar e atualizar contatos de funcionários, clientes e parceiros externos", function: function_62)
  Hability.find_or_create_by(name: "Registrar a ata de reuniões", function: function_62)
  Hability.find_or_create_by(name: "Suportar a elebaração de relatórios regulares", function: function_62)
  Hability.find_or_create_by(name: "Desenvolver e manter um sistema de arquivamento", function: function_62)
  Hability.find_or_create_by(name: "Verificar e pedir material de escritório", function: function_62)
  Hability.find_or_create_by(name: "Organizar viagens", function: function_62)
  Hability.find_or_create_by(name: "Documentar despesas e entregar relatórios", function: function_62)

  function_63 = Function.find_or_create_by(name: 'Facilities', area: area_08)
  Hability.find_or_create_by(name: "Coordenar instalações como eletricidade, aquecimento, telecomunicações, etc", function: function_63)
  Hability.find_or_create_by(name: "Gerenciar manutenção de equipamentos e suprimentos ", function: function_63)
  Hability.find_or_create_by(name: "Atender padrões de saúde e segurança", function: function_63)
  Hability.find_or_create_by(name: "Realizar inspeções para determinar necessidade de reparos e reformas", function: function_63)
  Hability.find_or_create_by(name: "Analisar o consumo de utilitários", function: function_63)
  Hability.find_or_create_by(name: "Supervisionar todos os funcionários e terceiros relacionados", function: function_63)
  Hability.find_or_create_by(name: "Controlar espaço de estacionamento, tratamento de resíduos e segurança do edifício", function: function_63)
  Hability.find_or_create_by(name: "Lidar com planos de seguros e contratos de serviços", function: function_63)
  Hability.find_or_create_by(name: "Gerenciar o orçamento da área", function: function_63)

  function_64 = Function.find_or_create_by(name: 'Operação e Administração de Vendas - Gerente', area: area_08)
  Hability.find_or_create_by(name: "Processar pedidos", function: function_64)
  Hability.find_or_create_by(name: "Verificar dados em pedidos e faturas", function: function_64)
  Hability.find_or_create_by(name: "Entrar em contato para obter informações", function: function_64)
  Hability.find_or_create_by(name: "Garantir entrega em tempo hábil", function: function_64)
  Hability.find_or_create_by(name: "Manter e atualizar registro de vendas para clientes", function: function_64)
  Hability.find_or_create_by(name: "Desenvolver relatórios de vendas mensais", function: function_64)
  Hability.find_or_create_by(name: "Informar opniões de clientes internamente", function: function_64)
  Hability.find_or_create_by(name: "Analisar metas e atingimento de vendas", function: function_64)

  # AREA 09
  area_09 = Area.find_or_create_by(name: 'TI: Infraestrutura, Suporte, Redes e Telecom')

  # FUNCOES AREA 09
  function_65 = Function.find_or_create_by(name: 'Infraestrutura', area: area_09)
  Hability.find_or_create_by(name: "Gerenciar banco de dados", function: function_65)
  Hability.find_or_create_by(name: "Gerenciar servidores", function: function_65)
  Hability.find_or_create_by(name: "Supervisionar armazenamento na Núvem", function: function_65)
  Hability.find_or_create_by(name: "Suportar ERPS", function: function_65)
  Hability.find_or_create_by(name: "Suportar chamadas de help desk ", function: function_65)
  Hability.find_or_create_by(name: "Administrar redes", function: function_65)
  Hability.find_or_create_by(name: "Cuidar da segurança da informação", function: function_65)
  Hability.find_or_create_by(name: "Gerenciar equipamentos e planos de telefonia", function: function_65)
  Hability.find_or_create_by(name: "Estruturar plano de contingência", function: function_65)
  Hability.find_or_create_by(name: "Contratar prestadores de serviços", function: function_65)
  Hability.find_or_create_by(name: "Administrar orçamento", function: function_65)
  Hability.find_or_create_by(name: "Redigir políticas e procedimentos", function: function_65)
  Hability.find_or_create_by(name: "Moritorar e reportar não conformidades", function: function_65)

  function_66 = Function.find_or_create_by(name: 'Segurança', area: area_09)
  Hability.find_or_create_by(name: "Manter políticas e procedimentos de segurança da informação", function: function_66)
  Hability.find_or_create_by(name: "Controlar perfis e níveis de acesso", function: function_66)
  Hability.find_or_create_by(name: "Atender as metas e padrões da segurança da organização", function: function_66)
  Hability.find_or_create_by(name: "Identificar riscos de segurança e resolvê-los", function: function_66)
  Hability.find_or_create_by(name: "Atualizar a organização sobre práticas seguras", function: function_66)
  Hability.find_or_create_by(name: "Monitorar sistemas internos de controle", function: function_66)
  Hability.find_or_create_by(name: "Realizar testes de invasão preventivos", function: function_66)
  Hability.find_or_create_by(name: "Controlar acesso remoto ", function: function_66)
  Hability.find_or_create_by(name: "Proteger informação em dispositivos de terceiros", function: function_66)

  function_67 = Function.find_or_create_by(name: 'Arquiteto de Redes', area: area_09)
  Hability.find_or_create_by(name: "Projetar redes WAN, LAN e outros sistemas de dados", function: function_67)
  Hability.find_or_create_by(name: "Testar e avaliar redes", function: function_67)
  Hability.find_or_create_by(name: "Analisar requisitos de negócios", function: function_67)
  Hability.find_or_create_by(name: "Realizar modelagem, análise e planejamento de redes", function: function_67)
  Hability.find_or_create_by(name: "Instalar equipamentos de hardware", function: function_67)
  Hability.find_or_create_by(name: "Desenvolver rotas de dados", function: function_67)
  Hability.find_or_create_by(name: "Configurar drivers para redes de software", function: function_67)
  Hability.find_or_create_by(name: "Gerenciar fornecedores de tecnologia", function: function_67)

  function_68 = Function.find_or_create_by(name: 'Administrador de Redes', area: area_09)
  Hability.find_or_create_by(name: "Configurar e atualizar redes e servidores internos", function: function_68)
  Hability.find_or_create_by(name: "Instalar e integrar novos aplicativos ", function: function_68)
  Hability.find_or_create_by(name: "Suportar e administrar aplicativos de terceiros", function: function_68)
  Hability.find_or_create_by(name: "Garantir segurança e conectividade de rede", function: function_68)
  Hability.find_or_create_by(name: "Monitorar desempenho de rede", function: function_68)
  Hability.find_or_create_by(name: "Configurar contas de usuários, permissões e senhas", function: function_68)
  Hability.find_or_create_by(name: "Resolver problemas de usuários", function: function_68)
  Hability.find_or_create_by(name: "Especificar requisitos de sistemae soluções de design", function: function_68)

  function_69 = Function.find_or_create_by(name: 'Help Desk e Suporte', area: area_09)
  Hability.find_or_create_by(name: "Fornecer suporte de 1o nível", function: function_69)
  Hability.find_or_create_by(name: "Fornecer suporte de 2o nível", function: function_69)
  Hability.find_or_create_by(name: "Fornecer suporte de 3o nível", function: function_69)
  Hability.find_or_create_by(name: "Rastrear, rotear e redirecionar chamados ", function: function_69)
  Hability.find_or_create_by(name: "Solicitar próximo nível em problemas não resolvidos", function: function_69)
  Hability.find_or_create_by(name: "Atualizar dados de usuários", function: function_69)
  Hability.find_or_create_by(name: "Produzir relatórios de atividades", function: function_69)

  function_70 = Function.find_or_create_by(name: 'Engenheiro de Telecomunicações', area: area_09)
  Hability.find_or_create_by(name: "Qualificar equipamentos e informar autoridades em caso de alteração", function: function_70)
  Hability.find_or_create_by(name: "Projetar e construir o sistema de comunicações", function: function_70)
  Hability.find_or_create_by(name: "Atender legislação e normas vigentes", function: function_70)
  Hability.find_or_create_by(name: "Antecipar e prevenir potenciais problemas", function: function_70)
  Hability.find_or_create_by(name: "Identificar e suportar problemas técnicos", function: function_70)
  Hability.find_or_create_by(name: "Visitar e realizar manutenção no local", function: function_70)
  Hability.find_or_create_by(name: "Atuar prontamente em situações de urgência", function: function_70)
  Hability.find_or_create_by(name: "Instalar circuitos e  sistemas de telecomunicações", function: function_70)
  Hability.find_or_create_by(name: "Selecionar equipamentos a serem adquiridos", function: function_70)

  # AREA 10
  area_10 = Area.find_or_create_by(name: 'TI: Banco de dados e Analytics')

  # FUNCOES AREA 10
  function_71 = Function.find_or_create_by(name: 'Operações de Datacenter', area: area_10)
  Hability.find_or_create_by(name: "Realizar manutenção preventiva no Datacenter", function: function_71)
  Hability.find_or_create_by(name: "Administrar solicitações de serviços", function: function_71)
  Hability.find_or_create_by(name: "Gerenciar processos críticos ", function: function_71)
  Hability.find_or_create_by(name: "Documentar registro de equipamentos", function: function_71)
  Hability.find_or_create_by(name: "Administrar equipamentos de backup", function: function_71)
  Hability.find_or_create_by(name: "Manter estoque de equipamentos", function: function_71)
  Hability.find_or_create_by(name: "Gerenciar problemas recorrentes ", function: function_71)

  function_72 = Function.find_or_create_by(name: 'Administrador de Banco de Dados (DBA)', area: area_10)
  Hability.find_or_create_by(name: "Construir sistemas de banco de dados", function: function_72)
  Hability.find_or_create_by(name: "Definir usuários e ativar dados correspondentes", function: function_72)
  Hability.find_or_create_by(name: "Recuperar dados em backups", function: function_72)
  Hability.find_or_create_by(name: "Minimizar tempo de inatividade do banco", function: function_72)
  Hability.find_or_create_by(name: "Forncer suporte de gerenciamento de dados aos usuários", function: function_72)
  Hability.find_or_create_by(name: "Documentar políticas, procedimentos e padrões", function: function_72)
  Hability.find_or_create_by(name: "Relaizar testes e avaliações", function: function_72)
  Hability.find_or_create_by(name: "Garantir segurança, privacidade e integridade dos dados", function: function_72)

  function_73 = Function.find_or_create_by(name: 'Arquitetura de dados', area: area_10)
  Hability.find_or_create_by(name: "Desenvolver soluções de banco de dados", function: function_73)
  Hability.find_or_create_by(name: "Instalar e configurar sistemas de informação", function: function_73)
  Hability.find_or_create_by(name: "Analisar requisitos estruturais de novos aplicativos", function: function_73)
  Hability.find_or_create_by(name: "Migrar dados de sistemas legados para novas soluções", function: function_73)
  Hability.find_or_create_by(name: "Modelar dados conceituais e lógicos e fluxogramas", function: function_73)
  Hability.find_or_create_by(name: "Melhorar desempenho do sistema ", function: function_73)
  Hability.find_or_create_by(name: "Resolver problemas de integração", function: function_73)
  Hability.find_or_create_by(name: "Definir procedimentos de segurança e backup", function: function_73)
  Hability.find_or_create_by(name: "Fornecer suporte operacional para infomações gerenciais", function: function_73)

  function_74 = Function.find_or_create_by(name: 'Business Inteligence', area: area_10)
  Hability.find_or_create_by(name: "Elaborar relatórios para suportar o negócio", function: function_74)
  Hability.find_or_create_by(name: "Desenvolver aplicações para atender necessidades de clientes", function: function_74)
  Hability.find_or_create_by(name: "Implementar sistemas de datawarehouse para análises de BI", function: function_74)
  Hability.find_or_create_by(name: "Construir dashboards para apresentação de resultados", function: function_74)
  Hability.find_or_create_by(name: "Analisar dados históricos e criar relatórios e KPIs", function: function_74)
  Hability.find_or_create_by(name: "Utilizar ferramentas de BI para efetuar análises", function: function_74)
  Hability.find_or_create_by(name: "Construir tabelas dinâmicas", function: function_74)
  Hability.find_or_create_by(name: "Identificar tendências de mercado e oportunidades", function: function_74)

  function_75 = Function.find_or_create_by(name: 'Cientista de dados', area: area_10)
  Hability.find_or_create_by(name: "Processar alto volume de dados (Big Data)", function: function_75)
  Hability.find_or_create_by(name: "Estimar tendências futuras", function: function_75)
  Hability.find_or_create_by(name: "Realizar análise estatíscas", function: function_75)
  Hability.find_or_create_by(name: "Utilizar modelos e ferramentas complexas de análise", function: function_75)
  Hability.find_or_create_by(name: "Analisar dados não estruturados", function: function_75)
  Hability.find_or_create_by(name: "Criar cenários sobre futuras possibilidades", function: function_75)
  Hability.find_or_create_by(name: "Investigar novas possibilidades através de dados", function: function_75)

  # AREA 11
  area_11 = Area.find_or_create_by(name: 'TI: Desenvolvimento e metodologia Ágil')

  # FUNCOES AREA 11
  function_76 = Function.find_or_create_by(name: 'Arquitetura de Software', area: area_11)
  Hability.find_or_create_by(name: "Desenvolver especificações de alto nível", function: function_76)
  Hability.find_or_create_by(name: "Integrar e viabilizar o sistema", function: function_76)
  Hability.find_or_create_by(name: "Avaliar todos os aspectos do desenvolvimento", function: function_76)
  Hability.find_or_create_by(name: "Definir padrões de codificação", function: function_76)
  Hability.find_or_create_by(name: "Estruturar o fluxo de trabalho", function: function_76)
  Hability.find_or_create_by(name: "Acompanhar a evolução com diretrizes", function: function_76)
  Hability.find_or_create_by(name: "Atender requisitos de segurança e atualizações", function: function_76)
  Hability.find_or_create_by(name: "Aprovar produto final", function: function_76)

  function_77 = Function.find_or_create_by(name: 'UX/ UI', area: area_11)
  Hability.find_or_create_by(name: "Avaliar requisitos do usuário", function: function_77)
  Hability.find_or_create_by(name: "Ilustrar ideias de design usando ferramentas", function: function_77)
  Hability.find_or_create_by(name: "Projetar elementos gráficos da interface do usuário", function: function_77)
  Hability.find_or_create_by(name: "Construit a navebilidade e campos de pesquisa", function: function_77)
  Hability.find_or_create_by(name: "Desenvolver maquetes e protótipos de UI", function: function_77)
  Hability.find_or_create_by(name: "Criar designs gráficos originais", function: function_77)
  Hability.find_or_create_by(name: "Identificar e ajustar problemas de UX", function: function_77)
  Hability.find_or_create_by(name: "Definir estilo por meio de fontes, cores e imagens", function: function_77)

  function_78 = Function.find_or_create_by(name: 'Desenvolvimento Front End', area: area_11)
  Hability.find_or_create_by(name: "Usar linguagens de Front End para criar páginas", function: function_78)
  Hability.find_or_create_by(name: "Otimizar velocidade dos aplicativos", function: function_78)
  Hability.find_or_create_by(name: "Projetar recursos para Desktop e dispositivos móveis", function: function_78)
  Hability.find_or_create_by(name: "Colaborar com desenvolvedores de Back End ", function: function_78)
  Hability.find_or_create_by(name: "Obter opniniões de usuários para melhorias", function: function_78)
  Hability.find_or_create_by(name: "Escrever docimentos e guias de requisitos funcionais", function: function_78)
  Hability.find_or_create_by(name: "Criar modelos e protótipos de qualidade", function: function_78)

  function_79 = Function.find_or_create_by(name: 'Desenvolvimento Back End', area: area_11)
  Hability.find_or_create_by(name: "Codificar e depurar o aplicativo", function: function_79)
  Hability.find_or_create_by(name: "Solucionar problemas de execução", function: function_79)
  Hability.find_or_create_by(name: "Realizar testes de interface com usuário", function: function_79)
  Hability.find_or_create_by(name: "Desenvolver a lógica e algorítimos do sistema", function: function_79)
  Hability.find_or_create_by(name: "Escrever códigos e bibliotecas reutilizáveis", function: function_79)
  Hability.find_or_create_by(name: "Auxiliar o Front End com a lógica do servidor", function: function_79)

  function_80 = Function.find_or_create_by(name: 'Desenvolvimento Full Stack', area: area_11)
  Hability.find_or_create_by(name: "Projetar estrutura geral do aplicativo", function: function_80)
  Hability.find_or_create_by(name: "Desenvolver para dispositivos Móveis e Desktops", function: function_80)
  Hability.find_or_create_by(name: "Integrar Front End e Back End", function: function_80)
  Hability.find_or_create_by(name: "Desenvolver estruutra completa do aplicativo", function: function_80)
  Hability.find_or_create_by(name: "Manter a integridade e organização do código", function: function_80)

  function_81 = Function.find_or_create_by(name: 'Desenvolvimento Mobile', area: area_11)
  Hability.find_or_create_by(name: "Produzir aplicativos móveis ", function: function_81)
  Hability.find_or_create_by(name: "Suportar o ciclo de vida da aplicação", function: function_81)
  Hability.find_or_create_by(name: "Avaliar requisitos e sugerir soluções", function: function_81)
  Hability.find_or_create_by(name: "Solicitar testes e resolver erros", function: function_81)
  Hability.find_or_create_by(name: "Melhorar experiência do usuário", function: function_81)
  Hability.find_or_create_by(name: "Sugerir tendências de mercado", function: function_81)
  Hability.find_or_create_by(name: "Disponibilizar produto em lojas de aplicativos", function: function_81)

  function_82 = Function.find_or_create_by(name: 'Devops', area: area_11)
  Hability.find_or_create_by(name: "Integrar desenvolvimento, operações e infraestrutura", function: function_82)
  Hability.find_or_create_by(name: "Realizar atualizações e correções", function: function_82)
  Hability.find_or_create_by(name: "Construir ferramentas para minimizar erros", function: function_82)
  Hability.find_or_create_by(name: "Entender a causa raiz em erros de produção", function: function_82)
  Hability.find_or_create_by(name: "Investigar e resolver problemas técnicos", function: function_82)
  Hability.find_or_create_by(name: "Desenvolver scripts para automatizar a visualização", function: function_82)
  Hability.find_or_create_by(name: "Elaborar procedimentos de manutenção", function: function_82)

  function_83 = Function.find_or_create_by(name: 'Testes e Qualidade', area: area_11)
  Hability.find_or_create_by(name: "Revisar especificações e documentos técnicos ", function: function_83)
  Hability.find_or_create_by(name: "Criar e executar planos de teste", function: function_83)
  Hability.find_or_create_by(name: "Identificar, rastrear e documentar problemas", function: function_83)
  Hability.find_or_create_by(name: "Realizar testes após correção de erros", function: function_83)
  Hability.find_or_create_by(name: "Monitorar resultados do processo de depuração", function: function_83)
  Hability.find_or_create_by(name: "Estar atulizado com ferramentas de testes", function: function_83)
  Hability.find_or_create_by(name: "Atender métricas de qualidade para quantidade e resolução de erros", function: function_83)

  function_84 = Function.find_or_create_by(name: 'Dono do Produto', area: area_11)
  Hability.find_or_create_by(name: "Planjear e evoluir o produto", function: function_84)
  Hability.find_or_create_by(name: "Fornecer visão e direção para desenvolvimento ágil", function: function_84)
  Hability.find_or_create_by(name: "Garantir tarefas para desenvolvimento", function: function_84)
  Hability.find_or_create_by(name: "Transmitir a visão do produto", function: function_84)
  Hability.find_or_create_by(name: "Propor melhorias e adpatações", function: function_84)

  function_85 = Function.find_or_create_by(name: 'Scrum Master', area: area_11)
  Hability.find_or_create_by(name: "Orientar equipe na metodologia ágil", function: function_85)
  Hability.find_or_create_by(name: "Promover a auto organização do time", function: function_85)
  Hability.find_or_create_by(name: "Remover impedimentos para produção", function: function_85)
  Hability.find_or_create_by(name: "Facilitar a discussão e tomada de decisões", function: function_85)
  Hability.find_or_create_by(name: "Resolver potenciais conflitos", function: function_85)
  Hability.find_or_create_by(name: "Auxiliar nas pendências do produto", function: function_85)

  function_86 = Function.find_or_create_by(name: 'Agile Coach', area: area_11)
  Hability.find_or_create_by(name: "Transmitir a metodolia ágil para a equipe", function: function_86)
  Hability.find_or_create_by(name: "Fornecer treinamento na metodologia", function: function_86)
  Hability.find_or_create_by(name: "Atuar como mentor nos projetos", function: function_86)
  Hability.find_or_create_by(name: "Verificar se as equipes estão usando a metodologia", function: function_86)
  Hability.find_or_create_by(name: "Indentificar e escalar riscos do projeto", function: function_86)
  Hability.find_or_create_by(name: "Suportar o responsável pelo produto", function: function_86)
  Hability.find_or_create_by(name: "Acompanhar o Scrum Master em ativididades", function: function_86)

  # AREA 12
  area_12 = Area.find_or_create_by(name: 'TI: Aplicações, CRMs e ERPs')

  # FUNCOES AREA 12
  function_87 = Function.find_or_create_by(name: 'Aplicações', area: area_12)
  Hability.find_or_create_by(name: "Entender demandas de negócio para oferecer soluções", function: function_87)
  Hability.find_or_create_by(name: "Monitorar operações diárias das equipes de desenvolvimento", function: function_87)
  Hability.find_or_create_by(name: "Trazer feedback para a equipe de operação", function: function_87)
  Hability.find_or_create_by(name: "Analisar requisitos de negócio e sugeir melhorias", function: function_87)
  Hability.find_or_create_by(name: "Gerenciar projetos de aplicativos e custos", function: function_87)
  Hability.find_or_create_by(name: "Administrar programas", function: function_87)
  Hability.find_or_create_by(name: "Auxliar departamentos internos ", function: function_87)

  function_88 = Function.find_or_create_by(name: 'Gerenciamento de Projetos', area: area_12)
  Hability.find_or_create_by(name: "Garantir projetos dentro do prazo e escopo", function: function_88)
  Hability.find_or_create_by(name: "Disponibilizar e alocar recursos internos e terceiros", function: function_88)
  Hability.find_or_create_by(name: "Gerenciar o orçamento do projeto", function: function_88)
  Hability.find_or_create_by(name: "Allinhar partes interessadas para garantir viabilidade técnica", function: function_88)
  Hability.find_or_create_by(name: "Acompanhar custos e orçamento do projeto", function: function_88)
  Hability.find_or_create_by(name: "Medir desempenho do projeto por métricas", function: function_88)
  Hability.find_or_create_by(name: "Minimizar riscos ao projeto", function: function_88)
  Hability.find_or_create_by(name: "Documentar plano e atividades", function: function_88)

  function_89 = Function.find_or_create_by(name: 'Levantamento de Requisitos', area: area_12)
  Hability.find_or_create_by(name: "Atuar como facilitador entre negócio e TI", function: function_89)
  Hability.find_or_create_by(name: "Levantar requisitos com usuários", function: function_89)
  Hability.find_or_create_by(name: "Sugerir modificações para melhor experiência do usuário", function: function_89)
  Hability.find_or_create_by(name: "Fornecer suporte e treinamento na implementação", function: function_89)
  Hability.find_or_create_by(name: "Colaborar com o desenvolvimento do projeto", function: function_89)

  function_90 = Function.find_or_create_by(name: 'Consultoria de Aplicações', area: area_12)
  Hability.find_or_create_by(name: "Desenvolver novas aplicações e programas", function: function_90)
  Hability.find_or_create_by(name: "Customizar a aplicação para a empresa", function: function_90)
  Hability.find_or_create_by(name: "Atualizar versões de aplicações", function: function_90)
  Hability.find_or_create_by(name: "Implementar soluções para erros existentes", function: function_90)
  Hability.find_or_create_by(name: "Desenvolver novas funcionalidades para atender o cliente", function: function_90)
  Hability.find_or_create_by(name: "Fornecer suporte técnico", function: function_90)
  Hability.find_or_create_by(name: "Treinar usuários e equipes", function: function_90)

# -------
# Creating First Title List
# -------
puts "---> Processing TitleList ..."
if TitleList.count == 0
  TitleList.find_or_create_by(name: 'Analista', priority: 1)
  TitleList.find_or_create_by(name: 'Especialista', priority: 2)
  TitleList.find_or_create_by(name: 'Consultor', priority: 3)
  TitleList.find_or_create_by(name: 'Coordenador', priority: 4)
  TitleList.find_or_create_by(name: 'Gerente', priority: 5)
  TitleList.find_or_create_by(name: 'Gerente Sr', priority: 6)
  TitleList.find_or_create_by(name: 'Diretor', priority: 7)
end

# -------
# Creating First Range List
# -------
puts "---> Processing RangeList ..."
if RangeList.count == 0
  RangeList.find_or_create_by(name: 'Anos')
  RangeList.find_or_create_by(name: 'Meses')
end

# -------
# Creating First Education List
# -------
puts "---> Processing EducationList ..."
EducationList.find_or_create_by(name: 'Técnico Completo')
EducationList.find_or_create_by(name: 'Superior Incompleto')
EducationList.find_or_create_by(name: 'Superior Completo')
EducationList.find_or_create_by(name: 'Pós graduação ou MBA')
EducationList.find_or_create_by(name: 'Mestrado')
EducationList.find_or_create_by(name: 'Doutorado')

# -------
# Creating First Language List
# -------
puts "---> Processing LanguageList ..."
LanguageList.find_or_create_by(name: 'Inglês')
LanguageList.find_or_create_by(name: 'Espanhol')
LanguageList.find_or_create_by(name: 'Alemão')
LanguageList.find_or_create_by(name: 'Francês')
LanguageList.find_or_create_by(name: 'Português')
LanguageList.find_or_create_by(name: 'Italiano')
LanguageList.find_or_create_by(name: 'Japonês')
LanguageList.find_or_create_by(name: 'Mandarim')
LanguageList.find_or_create_by(name: 'Coreano')

# -------
# Creating First Language Leve List
# -------
puts "---> Processing LanguageLevelList ..."
LanguageLevelList.find_or_create_by(name: 'lidero reuniões presenciais ou remotas para a resolução de problemas complexos')
LanguageLevelList.find_or_create_by(name: 'participo de reuniões como ouvinte e com contribuições pontuais')
LanguageLevelList.find_or_create_by(name: 'Somente por email')

# -------
# Creating First Nofsalaries List
# -------
puts "---> Processing NofsalariesList ..."
NofsalariesList.find_or_create_by(name: 'PJ (12 salários / ano)', value: 12)
NofsalariesList.find_or_create_by(name: 'CLT (13,33 salários / ano)', value: 13.33)

# -------
# Update Nofsalaries List if it already created (just in case this seed ran before 2018 Sep 24)
# -------
puts "---> Processing NofsalariesList ..."
if NofsalariesList.count == 2
  NofsalariesList.find(1).update_attributes(value: 12)
  NofsalariesList.find(2).update_attributes(value: 13.33)
end

# -------
# Creating First Benefits List
# -------
puts "---> Processing BenefitsList ..."
BenefitsList.find_or_create_by(name: 'Plano de saúde')
BenefitsList.find_or_create_by(name: 'Vale transporte')
BenefitsList.find_or_create_by(name: 'Ticket Refeição')
BenefitsList.find_or_create_by(name: 'Plano odontológico')
BenefitsList.find_or_create_by(name: 'Estacionamento')
BenefitsList.find_or_create_by(name: 'Vale supermercado')
BenefitsList.find_or_create_by(name: 'Seguro de vida')
BenefitsList.find_or_create_by(name: 'Previdência privada')
BenefitsList.find_or_create_by(name: 'Veículo')
BenefitsList.find_or_create_by(name: 'Bolsa de estudos')
BenefitsList.find_or_create_by(name: 'Ações')

# -------
# Creating First Annual Claim Rate List
# -------
puts "---> Processing AnnualClaimRateList ..."
AnnualClaimRateList.find_or_create_by(name: '30% de aumento ou mais', value: 30)
AnnualClaimRateList.find_or_create_by(name: '20% de aumento ou mais', value: 20)
AnnualClaimRateList.find_or_create_by(name: '10% de aumento ou mais', value: 10)
AnnualClaimRateList.find_or_create_by(name: 'A partir do mesmo', value: 0)
AnnualClaimRateList.find_or_create_by(name: '10% a menos', value: -10)
AnnualClaimRateList.find_or_create_by(name: '20% a menos', value: -20)
AnnualClaimRateList.find_or_create_by(name: '30% a menos', value: -30)

# -------
# Creating First Status List
# -------
puts "---> Processing StatusList ..."
StatusList.find_or_create_by(name: 'Interessado')
StatusList.find_or_create_by(name: 'Em processo')
StatusList.find_or_create_by(name: 'Aprovados')
StatusList.find_or_create_by(name: 'Eliminados')
StatusList.find_or_create_by(name: 'Arquivados')

# -------
# Creating First Step List
# -------
puts "---> Processing StepList ..."
StepList.find_or_create_by(name: 'Selecionados')
StepList.find_or_create_by(name: '1ª etapa')
StepList.find_or_create_by(name: '2ª etapa')
StepList.find_or_create_by(name: 'Última etapa')
StepList.find_or_create_by(name: 'Proposta')
StepList.find_or_create_by(name: 'Aprovados')

# -------
# Creating First Sort List
# -------
puts "---> Processing SortList ..."
SortList.find_or_create_by(name: 'Maior Remuneração Anual')
SortList.find_or_create_by(name: 'Menor Remuneração Anual')
SortList.find_or_create_by(name: 'Maior Remuneração Mensal')
SortList.find_or_create_by(name: 'Menor Remuneração Mensal')
SortList.find_or_create_by(name: 'Maior Tempo de Carreira')
SortList.find_or_create_by(name: 'Menor Tempo de Carreira')

# -------
# Update Annual Claim Rate List (2018 Sep 25)
# -------
puts "---> Processing AnnualClaimRateList ..."
if AnnualClaimRateList.count == 7 && AnnualClaimRateList.where("value IS ?", nil).present?
  AnnualClaimRateList.find_by_name('30% de aumento ou mais').update_attributes(value: 30)
  AnnualClaimRateList.find_by_name('20% de aumento ou mais').update_attributes(value: 20)
  AnnualClaimRateList.find_by_name('10% de aumento ou mais').update_attributes(value: 10)
  AnnualClaimRateList.find_by_name('A partir do mesmo').update_attributes(value: 0)
  AnnualClaimRateList.find_by_name('10% a menos').update_attributes(value: -10)
  AnnualClaimRateList.find_by_name('20% a menos').update_attributes(value: -20)
  AnnualClaimRateList.find_by_name('30% a menos').update_attributes(value: -30)
end

puts "---> ProcessingTerms"

Term.create(for: :candidate, title: 'Termos do Candidato', term: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima libero dicta necessitatibus alias voluptate, porro quo pariatur, illo eius magnam, ducimus, optio. Dicta, eos, repudiandae. Earum dicta non, voluptatum rem.", state: :published) unless Term.with_for(:candidate).published.present?
Term.create(for: :company  , title: 'Termos da Empresa'  , term: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima libero dicta necessitatibus alias voluptate, porro quo pariatur, illo eius magnam, ducimus, optio. Dicta, eos, repudiandae. Earum dicta non, voluptatum rem.", state: :published) unless Term.with_for(:company).published.present?

puts "---> Done :)"
