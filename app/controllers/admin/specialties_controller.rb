class Admin::SpecialtiesController < AdminController
  before_action :set_specialty, except: [:new, :create, :index]

  def index
    @specialties = Specialty.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.new(specialty_params)

    if @specialty.save
      redirect_to edit_admin_specialty_path(@specialty), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @specialty.update_attributes(specialty_params)
      redirect_to admin_specialties_path, notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @specialty.destroy

    redirect_to admin_specialties_path, notice: 'Removido com sucesso'
  end

  private
  def set_specialty
    @specialty = Specialty.find(params[:id])
  end

  def specialty_params
    params.require(:specialty).permit(:specialty)
  end
end
