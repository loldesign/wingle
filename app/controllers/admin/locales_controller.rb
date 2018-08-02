class Admin::LocalesController < AdminController
  before_action :set_locale, except: [:index, :new, :create]
  before_action :set_city_or_locale, except: [:destroy, :index]
  
  def index 
    # lista
    # route: GET /admin/locales
    @locales = Locale.order(created_at: :desc).paginate(page: params[:page] || 1, per_page: 30)
  end

  def new
    # formulario p/ adicionar + 1 no banco
    # route: GET /admin/locales/new

    @locale = Locale.new 
  end

  def create
    # é quando vc envia os dados preenchido no form do new
    # route: POST /admin/locales
    @locale = Locale.new(locale_params)
    @locale.city = City.find_by(name: 'São Paulo')

    if @locale.save
      redirect_to edit_admin_locale_path(@locale), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit 
    # formulario de edição de um registro já criado
    # route: GET /admin/locales/:id
  end

  def update
    # é quando vc envia os dados do formulario do edit
    # route: PUT /admin/locales/:id
    if @locale.update_attributes(locale_params)
      redirect_to edit_admin_locale_path(@locale), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def show 
    # quando vc exibe um registro já existente
    # route: GET /admin/locales/:id
  end

  def destroy 
    # quando vc deseja remover um registro existente
    # route: DELETE /admin/locales/:id
    @locale.destroy
    
    redirect_to admin_locales_path, notice: 'Removido com sucesso'
  end

  private
  def set_city_or_locale
    @country = Country.where(name: 'Brasil').first
    @state = State.where(name: 'São Paulo').first
    @city = City.where(name: 'São Paulo').first
  end

  def set_locale
    @locale = Locale.find(params[:id])
  end

  def locale_params
    params.require(:locale).permit(:name)
  end
end
