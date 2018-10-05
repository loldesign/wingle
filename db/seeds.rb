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

end

if CountryLocale.count == 0
  brasil   = Country.where(name: 'Brasil').first

  CountryLocale.create(name: 'Norte', country: brasil)
  CountryLocale.create(name: 'Nordeste', country: brasil)
  CountryLocale.create(name: 'Centro-Oeste', country: brasil)
  CountryLocale.create(name: 'Sudeste', country: brasil)
  CountryLocale.create(name: 'Sul', country: brasil)
end

if CityLocale.count == 0
  sp = City.first

  CityLocale.create(name: 'Zona Leste', city: sp)
  CityLocale.create(name: 'Zona Oeste', city: sp)
  CityLocale.create(name: 'Zona Sul', city: sp)
  CityLocale.create(name: 'Zona Norte', city: sp)
  CityLocale.create(name: 'Centro', city: sp)
end

if Neighborhood.count == 0
  sp = City.first
  east   = CityLocale.find(1)
  south  = CityLocale.find(3)
  center = CityLocale.find(5)

  Neighborhood.create(name: 'Mooca', city: sp, city_locale: east)
  Neighborhood.create(name: 'Cambuci', city: sp, city_locale: center)
  Neighborhood.create(name: 'Jabaquara', city: sp, city_locale: south)
  Neighborhood.create(name: 'Sé', city: sp, city_locale: center)
  Neighborhood.create(name: 'Vila Mariana', city: sp, city_locale: south)
  Neighborhood.create(name: 'Itaim', city: sp, city_locale: south)
  Neighborhood.create(name: 'Sapopemba', city: sp, city_locale: east)
  Neighborhood.create(name: 'Morumbi', city: sp, city_locale: south)
  Neighborhood.create(name: 'Moema', city: sp, city_locale: south)
  Neighborhood.create(name: 'Interlagos', city: sp, city_locale: south)
end

# if after Oct 5, 2018 it may have 10 neighborhoods
if Neighborhood.count == 10
  sp = City.first
  east   = CityLocale.find(1)
  west   = CityLocale.find(2)
  south  = CityLocale.find(3)
  north  = CityLocale.find(4)
  center = CityLocale.find(5)

  # Update old neighborhoods
  Neighborhood.find_by_name('Mooca').update_attributes(city_locale: east)
  Neighborhood.find_by_name('Cambuci').update_attributes(city_locale: center)
  Neighborhood.find_by_name('Jabaquara').update_attributes(city_locale: south)
  Neighborhood.find_by_name('Sé').update_attributes(city_locale: center)
  Neighborhood.find_by_name('Vila Mariana').update_attributes(city_locale: south)
  Neighborhood.find_by_name('Itaim').update_attributes(city_locale: south)
  Neighborhood.find_by_name('Sapopemba').update_attributes(city_locale: east)
  Neighborhood.find_by_name('Morumbi').update_attributes(city_locale: south)
  Neighborhood.find_by_name('Moema').update_attributes(city_locale: south)
  Neighborhood.find_by_name('Interlagos').update_attributes(city_locale: south)

  # Create new neighborhoods
  # Center
  Neighborhood.create(name: 'Bela Vista', city: sp, city_locale: center)
  Neighborhood.create(name: 'Liberdade', city: sp, city_locale: center)
  Neighborhood.create(name: 'Aclimação', city: sp, city_locale: center)
  Neighborhood.create(name: 'Consolação', city: sp, city_locale: center)
  Neighborhood.create(name: 'Higienópolis', city: sp, city_locale: center)
  Neighborhood.create(name: 'Santa Cecília', city: sp, city_locale: center)
  Neighborhood.create(name: 'República', city: sp, city_locale: center)
  Neighborhood.create(name: 'Bom Retiro', city: sp, city_locale: center)
  # South
  Neighborhood.create(name: 'Jardins', city: sp, city_locale: south)
  Neighborhood.create(name: 'Paulista', city: sp, city_locale: south)
  Neighborhood.create(name: 'Berrini', city: sp, city_locale: south)
  Neighborhood.create(name: 'Vila Olímpia', city: sp, city_locale: south)
  Neighborhood.create(name: 'Brooklin', city: sp, city_locale: south)
  Neighborhood.create(name: 'Campo Belo', city: sp, city_locale: south)
  Neighborhood.create(name: 'Saúde', city: sp, city_locale: south)
  Neighborhood.create(name: 'Chác. Sto. Antônio', city: sp, city_locale: south)
  Neighborhood.create(name: 'Sto. Amaro', city: sp, city_locale: south)
  Neighborhood.create(name: 'Socorro', city: sp, city_locale: south)
  Neighborhood.create(name: 'Cidade Jardim', city: sp, city_locale: south)
  Neighborhood.create(name: 'Ipiranga', city: sp, city_locale: south)
  Neighborhood.create(name: 'Cursino', city: sp, city_locale: south)
  Neighborhood.create(name: 'Sacomã', city: sp, city_locale: south)
  Neighborhood.create(name: 'ABC e região', city: sp, city_locale: south)
  # West
  Neighborhood.create(name: 'Pinheiros', city: sp, city_locale: west)
  Neighborhood.create(name: 'Alto de Pinheiros', city: sp, city_locale: west)
  Neighborhood.create(name: 'Vila Madalena', city: sp, city_locale: west)
  Neighborhood.create(name: 'Lapa', city: sp, city_locale: west)
  Neighborhood.create(name: 'Barra Funda', city: sp, city_locale: west)
  Neighborhood.create(name: 'Perdizes', city: sp, city_locale: west)
  Neighborhood.create(name: 'Vila Leopoldina', city: sp, city_locale: west)
  Neighborhood.create(name: 'Jaguaré', city: sp, city_locale: west)
  Neighborhood.create(name: 'Butantã', city: sp, city_locale: west)
  Neighborhood.create(name: 'Vila Sônia', city: sp, city_locale: west)
  Neighborhood.create(name: 'Raposo Tavares', city: sp, city_locale: west)
  Neighborhood.create(name: 'Osasco', city: sp, city_locale: west)
  Neighborhood.create(name: 'Barueri', city: sp, city_locale: west)
  Neighborhood.create(name: 'Alphaville e região', city: sp, city_locale: west)
  Neighborhood.create(name: 'Cotia', city: sp, city_locale: west)
  Neighborhood.create(name: 'Embú', city: sp, city_locale: west)
  Neighborhood.create(name: 'Taboão e região', city: sp, city_locale: west)
  # North
  Neighborhood.create(name: 'Santana', city: sp, city_locale: north)
  Neighborhood.create(name: 'Casa Verde', city: sp, city_locale: north)
  Neighborhood.create(name: 'Vila Guilherme', city: sp, city_locale: north)
  Neighborhood.create(name: 'Vila Maria', city: sp, city_locale: north)
  Neighborhood.create(name: 'Freguesia do Ó', city: sp, city_locale: north)
  Neighborhood.create(name: 'Brasilândia', city: sp, city_locale: north)
  Neighborhood.create(name: 'Pirituba', city: sp, city_locale: north)
  Neighborhood.create(name: 'São Domingos', city: sp, city_locale: north)
  Neighborhood.create(name: 'Jaraguá', city: sp, city_locale: north)
  Neighborhood.create(name: 'Guarulhos e região', city: sp, city_locale: north)
  # East
  Neighborhood.create(name: 'Brás', city: sp, city_locale: east)
  Neighborhood.create(name: 'Pari', city: sp, city_locale: east)
  Neighborhood.create(name: 'Belém', city: sp, city_locale: east)
  Neighborhood.create(name: 'Tatuapé', city: sp, city_locale: east)
  Neighborhood.create(name: 'Água Rasa', city: sp, city_locale: east)
  Neighborhood.create(name: 'Vila Prudente', city: sp, city_locale: east)
  Neighborhood.create(name: 'São Lucas', city: sp, city_locale: east)
  Neighborhood.create(name: 'Carrão', city: sp, city_locale: east)
  Neighborhood.create(name: 'Penha', city: sp, city_locale: east)
  Neighborhood.create(name: 'Vila Formosa', city: sp, city_locale: east)
  Neighborhood.create(name: 'Aricanduva', city: sp, city_locale: east)
  Neighborhood.create(name: 'Artur Alvim', city: sp, city_locale: east)
  Neighborhood.create(name: 'Itaquera', city: sp, city_locale: east)
  Neighborhood.create(name: 'Cidade São Mateus', city: sp, city_locale: east)
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
  Relevance.create(name: 'PORTE DA EMPRESA', priority: 3)
  Relevance.create(name: 'SETOR DE ATUAÇÃO', priority: 2)
  Relevance.create(name: 'LOCALIZAÇÃO', priority: 1)
end

# -------
# Creating First Areas, Functions and Habilities
# -------
if Area.count == 0
  # AREAS 01
  area_01 = Area.create(name: 'VENDAS & MARKETING')

  function_01 = Function.create(name: 'VENDAS', area: area_01)
  Hability.create(name: 'B2B', function: function_01)
  Hability.create(name: 'B2C', function: function_01)
  Hability.create(name: 'Captação de Novos Clientes', function: function_01)
  Hability.create(name: 'Relacionamento com Corretores', function: function_01)
  Hability.create(name: 'Relacionamento com Clientes', function: function_01)
  Hability.create(name: 'Contas Estratégicas', function: function_01)
  Hability.create(name: 'Call Center', function: function_01)
  Hability.create(name: 'Produtos', function: function_01)
  Hability.create(name: 'Serviços', function: function_01)
  Hability.create(name: 'Nacional', function: function_01)
  Hability.create(name: 'Internacional', function: function_01)

  function_02 = Function.create(name: 'CRM', area: area_01)
  Hability.create(name: 'Projetos de CRM', function: function_02)
  Hability.create(name: 'Mapear processos', function: function_02)
  Hability.create(name: 'Segmentação de Clientes', function: function_02)
  Hability.create(name: 'Análise de concorrentes', function: function_02)
  Hability.create(name: 'KPIs de performance', function: function_02)
  Hability.create(name: 'Marketing Tradicional', function: function_02)
  Hability.create(name: 'Marketing Digital', function: function_02)
  Hability.create(name: 'Email Marketing', function: function_02)
  Hability.create(name: 'Redes Sociais', function: function_02)

  function_03 = Function.create(name: 'PRICING', area: area_01)
  Hability.create(name: 'Estratégias de Preço', function: function_03)
  Hability.create(name: 'Posicionamento de Marca', function: function_03)
  Hability.create(name: 'Monitoramento de Preços', function: function_03)
  Hability.create(name: 'Análise da concorrência', function: function_03)
  Hability.create(name: 'Tendências de mercado', function: function_03)
  Hability.create(name: 'Custo de Produção', function: function_03)
  Hability.create(name: 'Análise de margem', function: function_03)
  Hability.create(name: 'Relatórios gerenciais', function: function_03)
  Hability.create(name: 'Cadastro de precos e descontos', function: function_03)
  Hability.create(name: 'Oportunidades tributárias', function: function_03)

  function_04 = Function.create(name: 'INOVAÇÃO', area: area_01)
  Hability.create(name: 'Novos produtos ou serviços', function: function_04)
  Hability.create(name: 'Análise de riscos e impactos', function: function_04)
  Hability.create(name: 'Envolvimento com áreas chave', function: function_04)
  Hability.create(name: 'Projetos Nacionais', function: function_04)
  Hability.create(name: 'Projetos Internacionais', function: function_04)
  Hability.create(name: 'Envolvimento com alta gestão', function: function_04)
  Hability.create(name: 'Novas patentes', function: function_04)
  Hability.create(name: 'Gestão de KPIs', function: function_04)

  function_05 = Function.create(name: 'BRANDING & MARCA', area: area_01)
  Hability.create(name: 'Posicionamento de marca', function: function_05)
  Hability.create(name: 'Alinhamento com objetivos da empresa', function: function_05)
  Hability.create(name: 'Estratégia go-to-market', function: function_05)
  Hability.create(name: 'Campanhas de Marketing', function: function_05)
  Hability.create(name: 'ROI', function: function_05)
  Hability.create(name: 'Análise de competidores', function: function_05)
  Hability.create(name: 'Tendência de mercado', function: function_05)
  Hability.create(name: 'Publicidade de acordo com a estratégia', function: function_05)
  Hability.create(name: 'KPIs', function: function_05)


  function_06 = Function.create(name: 'PRODUTO & CATEGORIA', area: area_01)
  Hability.create(name: 'Visão e estratégia do produto', function: function_06)
  Hability.create(name: 'Lançamento do produto', function: function_06)
  Hability.create(name: 'Desenvolvimento do produto', function: function_06)
  Hability.create(name: 'Implementação', function: function_06)
  Hability.create(name: 'Atendimento', function: function_06)
  Hability.create(name: 'Marketing & Vendas', function: function_06)
  Hability.create(name: 'Gestão de projetos', function: function_06)


  function_07 = Function.create(name: 'TRADE MARKETING', area: area_01)
  Hability.create(name: 'Verbas promocionais', function: function_07)
  Hability.create(name: 'Eventos', function: function_07)
  Hability.create(name: 'Oportunidade de negócios', function: function_07)
  Hability.create(name: 'Estratégia de marketing em campo', function: function_07)
  Hability.create(name: 'Comunicação entre Marketing e Vendas', function: function_07)
  Hability.create(name: 'Apresentar planos para clientes', function: function_07)
  Hability.create(name: 'Liderar equipe de promotores', function: function_07)

  function_08 = Function.create(name: 'PLANEJAMENTO ESTRATÉGICO', area: area_01)
  Hability.create(name: 'Analisar proposta de negócios', function: function_08)
  Hability.create(name: 'Ameaças e oportunidades', function: function_08)
  Hability.create(name: 'Modelos analíticos', function: function_08)
  Hability.create(name: 'Projeções', function: function_08)
  Hability.create(name: 'Alinhar processos e recursos com a estratégia', function: function_08)
  Hability.create(name: 'Análise de dados e recomendações', function: function_08)


  function_09 = Function.create(name: 'INTELIGÊNCIA DE MERCADO', area: area_01)
  Hability.create(name: 'Validação de dados', function: function_09)
  Hability.create(name: 'Políticas e procedimentos para coleta de dados', function: function_09)
  Hability.create(name: 'Selecionar ou desenvolver ferramentas para coleta de dados', function: function_09)
  Hability.create(name: 'Monitorar análises e métricas para o negócio', function: function_09)
  Hability.create(name: 'Relatórios gerenciais', function: function_09)


  function_10 = Function.create(name: 'MARKETING & COMUNICAÇÃORM', area: area_01)
  Hability.create(name: 'Estratégia de Marketing', function: function_10)
  Hability.create(name: 'Campanhas', function: function_10)
  Hability.create(name: 'Canais de Distribuição', function: function_10)
  Hability.create(name: 'Budget', function: function_10)
  Hability.create(name: 'Relacionamento com fornecedores', function: function_10)
  Hability.create(name: 'Medir performance das campanhas', function: function_10)
  Hability.create(name: 'Material e conteúdo para suporte de vendas', function: function_10)
  Hability.create(name: 'Blog e Website', function: function_10)
  Hability.create(name: 'Atração, conversão e retenção de clientes', function: function_10)

  function_11 = Function.create(name: 'RELAÇÕES PÚBLICAS', area: area_01)

  # AREA 02
  area_02 = Area.create(name: 'OPERAÇÕES & SUPPLY CHAIN')

  function_12 = Function.create(name: 'COMÉRCIO EXTERIOR', area: area_02)
  Hability.create(name: 'Importação', function: function_12)
  Hability.create(name: 'Exportação', function: function_12)
  Hability.create(name: 'Áereo', function: function_12)
  Hability.create(name: 'Marítimo', function: function_12)
  Hability.create(name: 'Rodoviário', function: function_12)
  Hability.create(name: 'Ferroviário', function: function_12)
  Hability.create(name: 'Importação', function: function_12)
  Hability.create(name: 'Exportação', function: function_12)
  Hability.create(name: 'Serviços aduaneiros', function: function_12)
  Hability.create(name: 'Alfândega', function: function_12)
  Hability.create(name: 'América do Norte', function: function_12)
  Hability.create(name: 'América Latina', function: function_12)
  Hability.create(name: 'Europa', function: function_12)
  Hability.create(name: 'Ásia', function: function_12)
  Hability.create(name: 'África', function: function_12)
  Hability.create(name: 'Oceania', function: function_12)


  function_13 = Function.create(name: 'LOGÍSTICA', area: area_02)
  Hability.create(name: 'Definição de Rotas', function: function_13)
  Hability.create(name: 'Priorização de pedidos para clientes', function: function_13)
  Hability.create(name: 'Analisar KPIs de fornecedores', function: function_13)
  Hability.create(name: 'PCP - Planejamento e controle da produção', function: function_13)
  Hability.create(name: 'Controle de estoque', function: function_13)
  Hability.create(name: 'Distribuição', function: function_13)

  function_14 = Function.create(name: 'COMPRAS', area: area_02)
  Hability.create(name: 'Matéria prima', function: function_14)
  Hability.create(name: 'Equipamentos', function: function_14)
  Hability.create(name: 'Serviços', function: function_14)
  Hability.create(name: 'Fornecedores estratégicos', function: function_14)
  Hability.create(name: 'Mercadorias', function: function_14)
  Hability.create(name: 'Nacional', function: function_14)
  Hability.create(name: 'Internacional', function: function_14)
  Hability.create(name: 'Desenvolvimento de fornecedores', function: function_14)
  Hability.create(name: 'Facilities', function: function_14)


  function_15 = Function.create(name: 'SUPPLY CHAIN', area: area_02)
  Hability.create(name: 'Controle de demanda e Supply', function: function_15)
  Hability.create(name: 'Compras', function: function_15)
  Hability.create(name: 'Comércio Exterior', function: function_15)
  Hability.create(name: 'Logística', function: function_15)
  Hability.create(name: 'Estoque', function: function_15)
  Hability.create(name: 'Transporte', function: function_15)
  Hability.create(name: 'Reestrutuação de Pessoas', function: function_15)
  Hability.create(name: 'Reestruturação de Processos', function: function_15)
  Hability.create(name: 'Indicadores financeiros', function: function_15)
  Hability.create(name: 'Projetos', function: function_15)
  Hability.create(name: 'Nacional', function: function_15)
  Hability.create(name: 'Internacional', function: function_15)


  function_16 = Function.create(name: 'OPERAÇÕES', area: area_02)
  Hability.create(name: 'KPIs', function: function_16)
  Hability.create(name: 'Projetos', function: function_16)
  Hability.create(name: 'Indústria', function: function_16)
  Hability.create(name: 'Serviços', function: function_16)
  Hability.create(name: 'Políticas', function: function_16)
  Hability.create(name: 'Processos', function: function_16)
  Hability.create(name: 'Projetos', function: function_16)


  # AREA 03
  area_03 = Area.create(name: 'FINANÇAS & TRIBUTÁRIO')

  function_17 = Function.create(name: 'CONTROLLER & CONTROLADORIA', area: area_03)
  Hability.create(name: 'Regional', function: function_17)
  Hability.create(name: 'Planta Fabril', function: function_17)
  Hability.create(name: 'Unidade de Negócios', function: function_17)
  Hability.create(name: 'USGAAP', function: function_17)
  Hability.create(name: 'IFRS', function: function_17)
  Hability.create(name: 'JAPAN GAP', function: function_17)
  Hability.create(name: 'Relatórios gerenciais', function: function_17)
  Hability.create(name: 'Real vs Orçado', function: function_17)
  Hability.create(name: 'Contábil', function: function_17)
  Hability.create(name: 'Análise de custos', function: function_17)

  function_18 = Function.create(name: 'TRIBUTÁRIO', area: area_03)
  Hability.create(name: 'Tributos diretos', function: function_18)
  Hability.create(name: 'Tributos indiretos', function: function_18)
  Hability.create(name: 'Planejamento tributário', function: function_18)
  Hability.create(name: 'Conciliação contábil', function: function_18)
  Hability.create(name: 'Nacional', function: function_18)
  Hability.create(name: 'Internacional', function: function_18)

  function_19 = Function.create(name: 'CONTABILIDADE', area: area_03)
  Hability.create(name: 'Consolidação de Balanços', function: function_19)
  Hability.create(name: 'CVM', function: function_19)
  Hability.create(name: 'CRC ativo', function: function_19)
  Hability.create(name: 'Livro contábil', function: function_19)
  Hability.create(name: 'Balanço patrimonial', function: function_19)
  Hability.create(name: 'DRE', function: function_19)
  Hability.create(name: 'Declarações', function: function_19)
  Hability.create(name: 'SPED fiscal', function: function_19)
  Hability.create(name: 'Análise do balanço', function: function_19)
  Hability.create(name: 'Relatório financeiro', function: function_19)
  Hability.create(name: 'Fechamento contábil', function: function_19)

  function_20 = Function.create(name: 'ADMINISRATIVO FINANCEIRO', area: area_03)
  Hability.create(name: 'Contas a pagar e receber', function: function_20)
  Hability.create(name: 'Reembolsos', function: function_20)
  Hability.create(name: 'Budget', function: function_20)
  Hability.create(name: 'Relatórios Financeiros', function: function_20)
  Hability.create(name: 'Registro de faturas e impostos', function: function_20)
  Hability.create(name: 'Gerenciamento de riscos', function: function_20)
  Hability.create(name: 'Pagamento de  salários', function: function_20)
  Hability.create(name: 'Projeção de Liquidez e Fluxo de caixa', function: function_20)
  Hability.create(name: 'Suportar auditoria', function: function_20)
  Hability.create(name: 'Verificar contabilidade', function: function_20)
  Hability.create(name: 'Reconciliações Financeiras', function: function_20)

  function_21 = Function.create(name: 'TESOURARIA', area: area_03)
  Hability.create(name: 'Contas a pagar', function: function_21)
  Hability.create(name: 'Contas a receber', function: function_21)
  Hability.create(name: 'Fluxo de caixa', function: function_21)
  Hability.create(name: 'Captação e linhas de crédito', function: function_21)
  Hability.create(name: 'Financiamento de importação e exportação', function: function_21)
  Hability.create(name: 'Operações com câmbio', function: function_21)
  Hability.create(name: 'Operações com commodities', function: function_21)
  Hability.create(name: 'Operações com renda variável', function: function_21)
  Hability.create(name: 'Operações com derivativos', function: function_21)

  function_22 = Function.create(name: 'NOVOS NEGÓCIOS', area: area_03)
  Hability.create(name: 'Valuation', function: function_22)
  Hability.create(name: 'Due Dilligence', function: function_22)
  Hability.create(name: 'Análise e execução de aquisições', function: function_22)
  Hability.create(name: 'Análise e venda de ativos', function: function_22)
  Hability.create(name: 'Análise de mercado', function: function_22)
  Hability.create(name: 'Suporte para decisões estratégicas da empresa', function: function_22)
  Hability.create(name: 'Análise de ativos e recursos passivos', function: function_22)
  Hability.create(name: 'Relacionamento com bancos', function: function_22)
  Hability.create(name: 'Relacionamento com consultorias', function: function_22)

  function_23 = Function.create(name: 'PLANEJAMENTO FINANCEIRO', area: area_03)
  Hability.create(name: 'Budget de Forecast', function: function_23)
  Hability.create(name: 'Análise de fluxo de caixa', function: function_23)
  Hability.create(name: 'Reportes Gerenciais', function: function_23)
  Hability.create(name: 'Reportes para investidores', function: function_23)
  Hability.create(name: 'P&L', function: function_23)
  Hability.create(name: 'Balanço', function: function_23)
  Hability.create(name: 'Cash Flow', function: function_23)
  Hability.create(name: 'Análise e Métricas de Competidores', function: function_23)
  Hability.create(name: 'Análise do Negócios', function: function_23)
  Hability.create(name: 'Análise de tendências', function: function_23)
  Hability.create(name: 'Controles Internos', function: function_23)
  Hability.create(name: 'CAPEX', function: function_23)
  Hability.create(name: 'OPEX', function: function_23)

  function_24 = Function.create(name: 'PLANEJAMENTO ESTRATÉGICO', area: area_03)
  Hability.create(name: 'Analisar proposta de negócios', function: function_24)
  Hability.create(name: 'Ameaças e oportunidades', function: function_24)
  Hability.create(name: 'Modelos analíticos', function: function_24)
  Hability.create(name: 'Projeções', function: function_24)
  Hability.create(name: 'Alinhar processos e recursos com a estratégia', function: function_24)
  Hability.create(name: 'Análise de dados e recomendações', function: function_24)

  function_25 = Function.create(name: 'AUDITORIA', area: area_03)
  Hability.create(name: 'Interna', function: function_25)
  Hability.create(name: 'Externa', function: function_25)
  Hability.create(name: 'Bancos', function: function_25)
  Hability.create(name: 'Seguradoras', function: function_25)
  Hability.create(name: 'Indústria', function: function_25)
  Hability.create(name: 'Serviços', function: function_25)
  Hability.create(name: 'Contábil', function: function_25)
  Hability.create(name: 'SOX', function: function_25)
  Hability.create(name: 'TI', function: function_25)
  Hability.create(name: 'Inventário', function: function_25)
  Hability.create(name: 'Nacional', function: function_25)
  Hability.create(name: 'Internacional', function: function_25)

  function_26 = Function.create(name: 'RELACIONAMENTO COM INVESTIDORES', area: area_03)
  Hability.create(name: 'Roadshows', function: function_26)
  Hability.create(name: 'Relatório para investidores', function: function_26)
  Hability.create(name: 'Relacionamento com a imprensa', function: function_26)
  Hability.create(name: 'Atender aos reguladores', function: function_26)
  Hability.create(name: 'Explicar o comportamento de ações', function: function_26)

  function_27 = Function.create(name: 'CRÉDITO E COBRANÇA', area: area_03)
  Hability.create(name: 'Análise de clientes', function: function_27)
  Hability.create(name: 'Limites de crédito', function: function_27)
  Hability.create(name: 'Redução da inadimplência', function: function_27)
  Hability.create(name: 'Recuperação de crédito', function: function_27)
  Hability.create(name: 'Nacionalidade', function: function_27)
  Hability.create(name: 'Estruturação do modelo de cobrança', function: function_27)

  # AREA 04
  area_04 = Area.create(name: 'RECURSOS HUMANOS')

  function_28 = Function.create(name: 'RECRUTAMENTO & SELEÇÃO', area: area_04)
  Hability.create(name: 'Operacional', function: function_28)
  Hability.create(name: 'Média gerência', function: function_28)
  Hability.create(name: 'Alto executivo', function: function_28)
  Hability.create(name: 'RH', function: function_28)
  Hability.create(name: 'Engenharia', function: function_28)
  Hability.create(name: 'Finanças', function: function_28)
  Hability.create(name: 'TI', function: function_28)
  Hability.create(name: 'Marketing', function: function_28)
  Hability.create(name: 'Vendas', function: function_28)
  Hability.create(name: 'Jurídico', function: function_28)
  Hability.create(name: 'Operações & Supply Chain', function: function_28)
  Hability.create(name: 'Bancos', function: function_28)
  Hability.create(name: 'Seguradoras', function: function_28)
  Hability.create(name: 'Recrutamento Interno', function: function_28)
  Hability.create(name: 'Consultoria', function: function_28)

  function_29 = Function.create(name: 'BUSINESS PARTNER', area: area_04)
  Hability.create(name: 'RH', function: function_29)
  Hability.create(name: 'Engenharia', function: function_29)
  Hability.create(name: 'Finanças', function: function_29)
  Hability.create(name: 'TI', function: function_29)
  Hability.create(name: 'Marketing', function: function_29)
  Hability.create(name: 'Vendas', function: function_29)
  Hability.create(name: 'Jurídico', function: function_29)
  Hability.create(name: 'Operações & Supply Chain', function: function_29)
  Hability.create(name: 'Bancos', function: function_29)
  Hability.create(name: 'Seguradoras', function: function_29)

  function_30 = Function.create(name: 'ADMINISTRAÇÃO DE PESSOAL', area: area_04)
  Hability.create(name: 'Realizar o pagamento dos funcionários', function: function_30)
  Hability.create(name: 'Manter os registros atualizados', function: function_30)
  Hability.create(name: 'E-social', function: function_30)
  Hability.create(name: 'Auditoria de folha', function: function_30)
  Hability.create(name: 'Relacionamento com fornecedores', function: function_30)
  Hability.create(name: 'Nacional', function: function_30)
  Hability.create(name: 'Latam', function: function_30)
  Hability.create(name: 'Internacional', function: function_30)

  function_31 = Function.create(name: 'TREINAMENTO & DESENVOLVIMENTO', area: area_04)
  Hability.create(name: 'Identificar necessidade com linha de negócio', function: function_31)
  Hability.create(name: 'Conduzir ou suportar seções de treinamento', function: function_31)
  Hability.create(name: 'Monitorar a efetividade do programa', function: function_31)
  Hability.create(name: 'Reportar o ROI', function: function_31)
  Hability.create(name: 'Gerenciar Budget', function: function_31)
  Hability.create(name: 'Operacional', function: function_31)
  Hability.create(name: 'Técnico', function: function_31)
  Hability.create(name: 'Comportamental', function: function_31)
  Hability.create(name: 'Liderança', function: function_31)

  function_32 = Function.create(name: 'REMUNERAÇÃO E BENEFÍCIOS', area: area_04)
  Hability.create(name: 'Desenvolver estrutura de cargos e salários', function: function_32)
  Hability.create(name: 'Criar regras e políticas para remuneração', function: function_32)
  Hability.create(name: 'Estruturação de benefícios', function: function_32)
  Hability.create(name: 'Revisão de Benefícios', function: function_32)
  Hability.create(name: 'Relacionamento com fornecedores', function: function_32)
  Hability.create(name: 'Controle de custos', function: function_32)

  function_33 = Function.create(name: 'GENERALISTA', area: area_04)
  Hability.create(name: 'Recrutamento e Seleção', function: function_33)
  Hability.create(name: 'Business Partner', function: function_33)
  Hability.create(name: 'Administração de Pessoal', function: function_33)
  Hability.create(name: 'Treinamento & Desenvolvimento', function: function_33)
  Hability.create(name: 'Remuneração e Benefícios', function: function_33)
  Hability.create(name: 'Estratégias de RH', function: function_33)

  # AREA 05
  area_05 = Area.create(name: 'TECNOLOGIA')

  function_34 = Function.create(name: 'INFRAESTRUTURA', area: area_05)
  Hability.create(name: 'Banco de Dados', function: function_34)
  Hability.create(name: 'Servidores', function: function_34)
  Hability.create(name: 'Armazenamento em Núvem', function: function_34)
  Hability.create(name: 'ERPS', function: function_34)
  Hability.create(name: 'Help Desk', function: function_34)
  Hability.create(name: 'Service Desk', function: function_34)
  Hability.create(name: 'Administração de Redes', function: function_34)
  Hability.create(name: 'Seguranaça da informação', function: function_34)
  Hability.create(name: 'Telefonia', function: function_34)
  Hability.create(name: 'Plano de contingência', function: function_34)
  Hability.create(name: 'Contratação de Serviços', function: function_34)
  Hability.create(name: 'Administração de Budget', function: function_34)
  Hability.create(name: 'Políticas e procedimentos', function: function_34)
  Hability.create(name: 'Monitoramento e reposte', function: function_34)
  Hability.create(name: 'Nacional', function: function_34)
  Hability.create(name: 'Internacional', function: function_34)
  Hability.create(name: 'Cisco', function: function_34)
  Hability.create(name: 'HDI', function: function_34)
  Hability.create(name: 'Linux/ Unix', function: function_34)
  Hability.create(name: 'Windows', function: function_34)
  Hability.create(name: 'Virtualização', function: function_34)
  Hability.create(name: 'AWS', function: function_34)
  Hability.create(name: 'Azure', function: function_34)
  Hability.create(name: 'Google', function: function_34)

  function_35 = Function.create(name: 'ERPs & CRMs', area: area_05)
  Hability.create(name: 'Mapeamento de Processos', function: function_35)
  Hability.create(name: 'Levantamento de Requisitos', function: function_35)
  Hability.create(name: 'Consultoria', function: function_35)
  Hability.create(name: 'Gerenciamento de Projetos', function: function_35)
  Hability.create(name: 'Oracle', function: function_35)
  Hability.create(name: 'SAP', function: function_35)
  Hability.create(name: 'Sales Force', function: function_35)
  Hability.create(name: 'Dynamics', function: function_35)
  Hability.create(name: 'Totvs', function: function_35)
  Hability.create(name: 'Sistemas Legados', function: function_35)
  Hability.create(name: 'Outros', function: function_35)
  Hability.create(name: 'Contratação de Fornecedores', function: function_35)
  Hability.create(name: 'Acompanhamento de KPIs', function: function_35)

  function_36 = Function.create(name: 'REDES', area: area_05)
  Hability.create(name: 'Projetos de redes', function: function_36)
  Hability.create(name: 'Instalação e configuração', function: function_36)
  Hability.create(name: 'Roteadores', function: function_36)
  Hability.create(name: 'Proxy Services', function: function_36)
  Hability.create(name: 'LAN', function: function_36)
  Hability.create(name: 'WAN', function: function_36)
  Hability.create(name: 'DNS', function: function_36)
  Hability.create(name: 'DHCP', function: function_36)
  Hability.create(name: 'Firewall', function: function_36)
  Hability.create(name: 'Outros', function: function_36)
  Hability.create(name: 'Monitoramento e Reporte', function: function_36)
  Hability.create(name: 'Contratação de Fornencedores', function: function_36)
  Hability.create(name: 'Cisco', function: function_36)
  Hability.create(name: 'Avaya', function: function_36)
  Hability.create(name: 'Linux/ Unix', function: function_36)
  Hability.create(name: 'Voip', function: function_36)

  function_37 = Function.create(name: 'SEGURANÇA', area: area_05)
  Hability.create(name: 'Cybersecurity', function: function_37)
  Hability.create(name: 'Testes de invasão', function: function_37)
  Hability.create(name: 'Perfis de acesso', function: function_37)
  Hability.create(name: 'Níveis de acesso', function: function_37)
  Hability.create(name: 'Acesso remoto', function: function_37)
  Hability.create(name: 'Políticas de Segurança', function: function_37)
  Hability.create(name: 'Protocolos e procedimentos', function: function_37)
  Hability.create(name: 'Dispositivos de terceiros', function: function_37)
  Hability.create(name: 'Monitoramento e gestão', function: function_37)
  Hability.create(name: 'Relacionamento com fornecedores', function: function_37)
  Hability.create(name: 'Certificado CIISP', function: function_37)
  Hability.create(name: 'Administação de Firewall', function: function_37)
  Hability.create(name: 'SOX', function: function_37)
  Hability.create(name: 'Administração de Linux/ Unix', function: function_37)

  function_38 = Function.create(name: 'BI & BIG DATA', area: area_05)
  Hability.create(name: 'BI - Tabelas Dinâmicas', function: function_38)
  Hability.create(name: 'BI - Dashboards', function: function_38)
  Hability.create(name: 'BI - Reportes', function: function_38)
  Hability.create(name: 'BI - Inteligência de Mercado', function: function_38)
  Hability.create(name: 'BIG DATA - Alto volume de dados', function: function_38)
  Hability.create(name: 'BIG DATA - Analytics', function: function_38)
  Hability.create(name: 'BIG DATA - Dados não estruturados', function: function_38)
  Hability.create(name: 'BIG DATA - Tendências', function: function_38)
  Hability.create(name: 'Power BI', function: function_38)
  Hability.create(name: 'Tableau', function: function_38)
  Hability.create(name: 'R', function: function_38)
  Hability.create(name: 'ETL', function: function_38)
  Hability.create(name: 'SQL Server', function: function_38)
  Hability.create(name: 'Hadoop', function: function_38)
  Hability.create(name: 'Pig', function: function_38)
  Hability.create(name: 'Teradata', function: function_38)
  Hability.create(name: 'SAS', function: function_38)
  Hability.create(name: 'Basona', function: function_38)
  Hability.create(name: 'Microstrategy', function: function_38)
  Hability.create(name: 'Oracle database', function: function_38)
  Hability.create(name: 'Python', function: function_38)
  Hability.create(name: 'PowerCenter', function: function_38)
  Hability.create(name: 'Business Objects', function: function_38)
  Hability.create(name: 'SSIS - Integrations Services', function: function_38)
  Hability.create(name: 'SSRS - Reports Services', function: function_38)
  Hability.create(name: 'SSAS - Analysis Services', function: function_38)

  function_39 = Function.create(name: 'SISTEMAS', area: area_05)
  Hability.create(name: 'DBA', function: function_39)
  Hability.create(name: 'Devops', function: function_39)
  Hability.create(name: 'Sistemas Legados', function: function_39)
  Hability.create(name: 'Orçamento de Sistemas', function: function_39)
  Hability.create(name: 'Projetos', function: function_39)
  Hability.create(name: 'Testes', function: function_39)
  Hability.create(name: 'Licenciamento de Softwares', function: function_39)
  Hability.create(name: 'Suporte', function: function_39)
  Hability.create(name: 'Desenvolvimento Interno', function: function_39)
  Hability.create(name: 'Contratação de Fornecedores', function: function_39)
  Hability.create(name: 'Oracle', function: function_39)
  Hability.create(name: 'SAP', function: function_39)
  Hability.create(name: 'Sales Force', function: function_39)
  Hability.create(name: 'Dynamics', function: function_39)
  Hability.create(name: 'Totvs', function: function_39)
  Hability.create(name: 'Sharepoint', function: function_39)
  Hability.create(name: 'Ajax', function: function_39)
  Hability.create(name: 'Apache', function: function_39)
  Hability.create(name: 'Linux', function: function_39)
  Hability.create(name: 'MySql', function: function_39)
  Hability.create(name: 'Tomcat', function: function_39)
  Hability.create(name: 'PHP', function: function_39)
  Hability.create(name: 'Websphere', function: function_39)
  Hability.create(name: 'Weblogic', function: function_39)

  function_39 = Function.create(name: 'DESENVOLVIMENTO', area: area_05)
  Hability.create(name: 'PO', function: function_39)
  Hability.create(name: 'Scrum Master', function: function_39)
  Hability.create(name: 'Agile Coach', function: function_39)
  Hability.create(name: 'Mobile', function: function_39)
  Hability.create(name: 'Front End', function: function_39)
  Hability.create(name: 'Back End', function: function_39)
  Hability.create(name: 'Engenheiro de Software', function: function_39)
  Hability.create(name: 'Full Stack', function: function_39)
  Hability.create(name: 'Quality Assurance', function: function_39)
  Hability.create(name: 'Python', function: function_39)
  Hability.create(name: 'Ruby', function: function_39)
  Hability.create(name: 'R', function: function_39)
  Hability.create(name: 'Java', function: function_39)
  Hability.create(name: 'Javascript', function: function_39)
  Hability.create(name: 'Node.js', function: function_39)
  Hability.create(name: 'Angular.js', function: function_39)
  Hability.create(name: 'React.js', function: function_39)
  Hability.create(name: 'PHP', function: function_39)
  Hability.create(name: '.NET', function: function_39)
  Hability.create(name: 'ASP', function: function_39)
  Hability.create(name: 'C#', function: function_39)
  Hability.create(name: 'C++', function: function_39)
  Hability.create(name: 'Delphi', function: function_39)

  # AREA 06
  area_06 = Area.create(name: 'MERCADO FINANCEIRO')

  # FUNCOES AREA 06

end

# -------
# Creating First Title List
# -------
if TitleList.count == 0
  TitleList.create(name: 'Analista', priority: 1)
  TitleList.create(name: 'Especialista', priority: 2)
  TitleList.create(name: 'Consultor', priority: 3)
  TitleList.create(name: 'Coordenador', priority: 4)
  TitleList.create(name: 'Gerente', priority: 5)
  TitleList.create(name: 'Gerente Sr', priority: 6)
  TitleList.create(name: 'Diretor', priority: 7)
end

# -------
# Creating First Range List
# -------
if RangeList.count == 0
  RangeList.create(name: 'Anos')
  RangeList.create(name: 'Meses')
end

# -------
# Creating First Education List
# -------
if EducationList.count == 0
  EducationList.create(name: 'Técnico Completo')
  EducationList.create(name: 'Superior Incompleto')
  EducationList.create(name: 'Superior Completo')
  EducationList.create(name: 'Pós graduação ou MBA')
  EducationList.create(name: 'Mestrado')
  EducationList.create(name: 'Doutorado')
end

# -------
# Creating First Language List
# -------
if LanguageList.count == 0
  LanguageList.create(name: 'Inglês')
  LanguageList.create(name: 'Espanhol')
  LanguageList.create(name: 'Alemão')
  LanguageList.create(name: 'Francês')
  LanguageList.create(name: 'Português')
  LanguageList.create(name: 'Italiano')
  LanguageList.create(name: 'Japonês')
  LanguageList.create(name: 'Mandarim')
  LanguageList.create(name: 'Coreano')
end

# -------
# Creating First Language Leve List
# -------
if LanguageLevelList.count == 0
  LanguageLevelList.create(name: 'lidero reuniões presenciais ou remotas para a resolução de problemas complexos')
  LanguageLevelList.create(name: 'participo de reuniões como ouvinte e com contribuições pontuais')
  LanguageLevelList.create(name: 'Somente por email')
end

# -------
# Creating First Nofsalaries List
# -------
if NofsalariesList.count == 0
  NofsalariesList.create(name: 'PJ (12 salários / ano)', value: 12)
  NofsalariesList.create(name: 'CLT (13,33 salários / ano)', value: 13.33)
end

# -------
# Update Nofsalaries List if it already created (just in case this seed ran before 2018 Sep 24)
# -------
if NofsalariesList.count == 2
  NofsalariesList.find(1).update_attributes(value: 12)
  NofsalariesList.find(2).update_attributes(value: 13.33)
end

# -------
# Creating First Benefits List
# -------
if BenefitsList.count == 0
  BenefitsList.create(name: 'Plano de saúde')
  BenefitsList.create(name: 'Vale transporte')
  BenefitsList.create(name: 'Ticket Refeição')
  BenefitsList.create(name: 'Plano odontológico')
  BenefitsList.create(name: 'Estacionamento')
  BenefitsList.create(name: 'Vale supermercado')
  BenefitsList.create(name: 'Seguro de vida')
  BenefitsList.create(name: 'Previdência privada')
  BenefitsList.create(name: 'Veículo')
  BenefitsList.create(name: 'Bolsa de estudos')
  BenefitsList.create(name: 'Ações')
end

# -------
# Creating First Annual Claim Rate List
# -------
if AnnualClaimRateList.count == 0
  AnnualClaimRateList.create(name: '30% de aumento ou mais', value: 30)
  AnnualClaimRateList.create(name: '20% de aumento ou mais', value: 20)
  AnnualClaimRateList.create(name: '10% de aumento ou mais', value: 10)
  AnnualClaimRateList.create(name: 'A partir do mesmo', value: 0)
  AnnualClaimRateList.create(name: '10% a menos', value: -10)
  AnnualClaimRateList.create(name: '20% a menos', value: -20)
  AnnualClaimRateList.create(name: '30% a menos', value: -30)
end

# -------
# Creating First Status List
# -------
if StatusList.count == 0
  StatusList.create(name: 'Interessado')
  StatusList.create(name: 'Em processo')
  StatusList.create(name: 'Aprovados')
  StatusList.create(name: 'Eliminados')
  StatusList.create(name: 'Arquivados')
end

# -------
# Creating First Step List
# -------
if StepList.count == 0
  StepList.create(name: 'Selecionados')
  StepList.create(name: '1ª etapa')
  StepList.create(name: '2ª etapa')
  StepList.create(name: 'Última etapa')
  StepList.create(name: 'Proposta')
  StepList.create(name: 'Aprovados')
end

# -------
# Creating First Sort List
# -------
if SortList.count == 0
  SortList.create(name: 'Maior Remuneração Anual')
  SortList.create(name: 'Menor Remuneração Anual')
  SortList.create(name: 'Maior Remuneração Mensal')
  SortList.create(name: 'Menor Remuneração Mensal')
  SortList.create(name: 'Maior Tempo de Carreira')
  SortList.create(name: 'Menor Tempo de Carreira')
end

# -------
# Update Annual Claim Rate List (2018 Sep 25)
# -------
if AnnualClaimRateList.count == 7 && AnnualClaimRateList.where("value IS ?", nil).present?
  AnnualClaimRateList.find_by_name('30% de aumento ou mais').update_attributes(value: 30)
  AnnualClaimRateList.find_by_name('20% de aumento ou mais').update_attributes(value: 20)
  AnnualClaimRateList.find_by_name('10% de aumento ou mais').update_attributes(value: 10)
  AnnualClaimRateList.find_by_name('A partir do mesmo').update_attributes(value: 0)
  AnnualClaimRateList.find_by_name('10% a menos').update_attributes(value: -10)
  AnnualClaimRateList.find_by_name('20% a menos').update_attributes(value: -20)
  AnnualClaimRateList.find_by_name('30% a menos').update_attributes(value: -30)
end