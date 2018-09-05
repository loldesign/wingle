class Admin::SectorsController < AdminController
	before_action :set_sector, except: [:new, :create, :index]

	def index
		@sectors = Sector.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@sector = Sector.new
	end

	def create
		@sector = Sector.new(sector_params)

		if @sector.save
			redirect_to edit_admin_sector_path(@sector), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @sector.update_attributes(sector_params)
			redirect_to admin_sectors_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@sector.destroy

		redirect_to admin_sectors_path, notice: 'Removido com sucesso'
	end

	private
	def set_sector
		@sector = Sector.find(params[:id])
	end

	def sector_params
		params.require(:sector).permit(:name, :description, :nickname, :score)
	end
end