class Admin::NeighborhoodsController < AdminController
  before_action :set_city_locale, except: [:index_by_city]
  before_action :set_neighborhood, except: [:new, :create, :index, :index_by_city]
  before_action :set_city, only: [:index_by_city]

  def index
    @neighborhoods = @neighborhood_group.neighborhoods.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def index_by_city
    @neighborhoods = @city.neighborhoods.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = @neighborhood_group.neighborhoods.build(neighborhood_params)
    @neighborhood.city = @city
    @neighborhood.city_locale = @city_locale

    if @neighborhood.save
      redirect_to edit_admin_state_city_city_locale_neighborhood_group_neighborhood_path(@state, @city, @city_locale, @neighborhood_group, @neighborhood), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @neighborhood.update_attributes(neighborhood_params)
      redirect_to admin_state_city_city_locale_neighborhood_group_neighborhoods_path(@state, @city, @city_locale, @neighborhood_group), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @neighborhood.destroy

    redirect_to admin_state_city_city_locale_neighborhood_group_neighborhoods_path(@state, @city, @city_locale, @neighborhood_group), notice: 'Removido com sucesso'
  end

  private
  def set_city_locale
    @neighborhood_group = NeighborhoodGroup.find(params[:neighborhood_group_id])
    @city_locale = @neighborhood_group.city_locale
    @city = @neighborhood_group.city
    @state = @city.state
  end

  def set_neighborhood
    @neighborhood = @city.neighborhoods.find(params[:id])
  end

  def set_city
    @city = City.find(params[:city_id])
    @state = @city.state
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:code, :name)
  end
end