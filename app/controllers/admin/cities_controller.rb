class Admin::CitiesController < AdminController
  before_action :set_state
  before_action :set_city, except: [:new, :create, :index]

  def index
    @cities = City.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    @city =  @state.cities.build(city_params)

    if @city.save
      redirect_to edit_admin_state_city_path(@state, @city), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @city.update_attributes(city_params)
      redirect_to edit_admin_state_city_path(@state, @city), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @city.destroy

    redirect_to admin_state_cities_path, notice: 'Removido com sucesso'
  end

  private
  def set_state
    @state = State.find(params[:state_id])
  end

  def set_city
    @city =  @state.cities.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end
end