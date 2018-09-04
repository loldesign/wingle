class Admin::CityLocalesController < AdminController
  before_action :set_city
  before_action :set_city_locale, except: [:new, :create, :index]

  def index
    @city_locales = @city.city_locales.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @city_locale = CityLocale.new
  end

  def create
    @city_locale = @city.city_locales.build(city_locale_params)

    if @city_locale.save
      redirect_to edit_admin_state_city_city_locale_path(@state, @city, @city_locale), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @city_locale.update_attributes(city_locale_params)
      redirect_to edit_admin_state_city_city_locale_path(@state, @city, @city_locale), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @city_locale.destroy
    
    redirect_to admin_state_city_city_locales_path(@state, @city), notice: 'Removido com sucesso'
  end

  private
  def set_city
    @city = City.find(params[:city_id])
    @state = @city.state
  end

  def set_city_locale
    @city_locale = @city.city_locales.find(params[:id])
  end

  def city_locale_params
    params.require(:city_locale).permit(:name)
  end
end