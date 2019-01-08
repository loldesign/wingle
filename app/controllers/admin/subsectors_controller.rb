class Admin::SubsectorsController < AdminController
	before_action :set_sector
	before_action :set_subsector, except: [:new, :create, :index]

	def index
		@subsectors = @sector.subsectors.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@subsector = Subsector.new
	end

	def create
		@subsector = @sector.subsectors.build(subsector_params)

		if @subsector.save
			redirect_to edit_admin_sector_subsector_path(@sector, @subsector), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @subsector.update_attributes(sector_params)
			redirect_to admin_sector_subsectors_path(@sector), notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@subsector.destroy

		redirect_to admin_sector_subsectors_path(@sector), notice: 'Removido com sucesso'
	end

	private
	def set_subsector
		@subsector = Subsector.find(params[:id])
	end

	def set_sector
		@sector = Sector.find(params[:sector_id])
	end

	def subsector_params
		params.require(:subsector).permit(:name)
	end
end