class Admin::StatesController < AdminController
  before_action :set_country
  before_action :set_state, except: [:new, :create, :index]

  def index
    @states = State.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @state = State.new
  end

  def create
    @state = @country.states.build(state_params)

    if @state.save
      redirect_to edit_admin_state_path(@state), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @state.update_attributes(state_params)
      redirect_to edit_admin_state_path(@state), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @state.destroy

    redirect_to admin_states_path, notice: 'Removido com sucesso'
  end

  private
  def set_country
    @country = Country.where(name: 'Brasil').first
  end

  def set_state
    @state = State.find(params[:id])
  end

  def state_params
    params.require(:state).permit(:name)
  end
end