class Admin::NeighborhoodsController < AdminController
  before_action :set_neighborhood, except: [:new, :create, :index]

  def index
    @neighborhood = Neighborhood.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.new(neighborhood_params)

    if @neighborhood.save
      redirect_to edit_admin_neighborhood_path(@neighborhood), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @neighborhood.update_attributes(neighborhood_params)
      redirect_to edit_admin_neighborhood_path(@neighborhood), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @neighborhood.destroy

    redirect_to admin_neighborhoods_path, notice: 'Removido com sucesso'
  end

  private
  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:id])
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:name)
  end
end