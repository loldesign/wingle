class Admin::PositionsController < AdminController
  before_action :set_position, except: [:new, :create, :index]

  def index
    @positions = Position.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new 
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)

    if @position.save
      redirect_to edit_admin_position_path(@position), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @position.update_atttibutes(position_params)
      redirect_to edit_admin_position_path(@position), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end 
  end

  def destroy
    @position.destroy

    redirect_to admin_positions_path, notice: 'Removido com sucesso'
  end

  private
  def set_position
    @position = Position.find(params[:id])
  end

  def position_params 
    params.require(:position).permit(:position)
  end
end
