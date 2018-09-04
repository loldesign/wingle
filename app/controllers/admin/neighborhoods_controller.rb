class Admin::NeighborhoodsController < AdminController
  before_action :set_city
  before_action :set_neighborhood, except: [:new, :create, :index]

  def index
    @neighborhoods = Neighborhood.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = @city.neighborhoods.build(neighborhood_params)

    if @neighborhood.save
      redirect_to edit_admin_state_city_neighborhood_path(@state, @city, @neighborhood), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @neighborhood.update_attributes(neighborhood_params)
      redirect_to edit_admin_state_city_neighborhood_path(@state, @city, @neighborhood), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @neighborhood.destroy

    redirect_to admin_state_city_neighborhoods_path(@state, @city), notice: 'Removido com sucesso'
  end

  private
  def set_city
    @city = City.find(params[:city_id])
    @state = @city.state
  end

  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:id])
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:name)
  end
end