class Admin::NeighborhoodGroupsController < AdminController
  before_action :set_city_locale
  before_action :set_neighborhood_group, except: [:new, :create, :index]

  def index
    @neighborhood_groups = @city_locale.neighborhood_groups.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @neighborhood_group = NeighborhoodGroup.new
  end

  def create
    @neighborhood_group = @city.neighborhood_groups.build(neighborhood_group_params)
    @neighborhood_group.city_locale = @city_locale

    if @neighborhood_group.save
      redirect_to edit_admin_state_city_city_locale_neighborhood_group_path(@state, @city, @city_locale, @neighborhood_group), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @neighborhood_group.update_attributes(neighborhood_group_params)
      redirect_to admin_state_city_city_locale_neighborhood_groups_path(@state, @city, @city_locale), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @neighborhood_group.destroy

    redirect_to admin_state_city_city_locale_neighborhood_groups_path(@state, @city, @city_locale), notice: 'Removido com sucesso'
  end

  private
  def set_city_locale
    @city_locale = CityLocale.find(params[:city_locale_id])
    @city = @city_locale.city
    @state = @city.state
  end

  def set_neighborhood_group
    @neighborhood_group = @city_locale.neighborhood_groups.find(params[:id])
  end

  def neighborhood_group_params
    params.require(:neighborhood_group).permit(:code, :name)
  end
end