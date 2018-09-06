class Admin::AreasController < AdminController
	before_action :set_area, except: [:new, :create, :index]

	def index
		@areas = Area.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@area = Area.new
	end

	def create
		@area = Area.new(area_params)

		if @area.save
			redirect_to edit_admin_area_path(@area), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @area.update_attributes(area_params)
			redirect_to admin_areas_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@area.destroy

		redirect_to admin_areas_path, notice: 'Removido com sucesso'
	end

	private
	def set_area
		@area = Area.find(params[:id])
	end

	def area_params
		params.require(:area).permit(:name)
	end
end