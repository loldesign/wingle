class Admin::PackageServicesController < AdminController
  before_action :set_package_service, except: [:new, :create, :index]

  def index
    @package_services = PackageService.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new
    @package_service = PackageService.new
  end

  def create
    @package_service = PackageService.new(package_service_params)

    if @package_service.save
      redirect_to edit_admin_package_service_path(@package_service), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @package_service.update_attributes(service_params)
      redirect_to edit_admin_package_service_path(@package_service), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end    
  end

  def destroy
    @package_service.destroy

    redirect_to admin_package_services_path, notice: 'Removido com sucesso'
  end

  private
  def set_package_service
    @package_service = PackageService.find(params[:id])
  end

  def package_service_params
    params.require(:package_service).permit(:package_title, :description, :signature, :value)
  end
end
