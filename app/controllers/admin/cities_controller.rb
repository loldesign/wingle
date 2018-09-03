class Admin::CitiesController < AdminController
  before_action :set_city, except: [:new, :create, :index]

  def index
    @city = City.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to edit_admin_city_path(@city), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @city.update_attributes(city_params)
      redirect_to edit_admin_city_path(@city), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @city.destroy

    redirect_to admin_cities_path, notice: 'Removido com sucesso'
  end

  private
  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end
end