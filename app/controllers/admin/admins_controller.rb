class Admin::AdminsController < AdminController

  before_action :set_admin, except: [:new, :create, :index]

  def index
    
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to edit_admin_admin_path(@admin), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @admin.update_attributes(admin_params)
      redirect_to edit_admin_admin_path(@admin), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @admin.destroy

    redirect_to admin_admins_path, notice: 'Removido com sucesso'
  end

  def show
  end

  private
  def set_admin
    @admin = Admin.find params[:id]
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
