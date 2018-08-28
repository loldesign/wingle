class Admin::HabilitiesController < AdminController
	before_action :set_function
	before_action :set_hability, except: [:new, :create, :index]

	def index
		@habilities = @function.habilities.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@hability = Hability.new
	end

	def create
		@hability = @function.habilities.build(hability_params)

		if @hability.save
			redirect_to edit_admin_area_function_hability_path(@area, @function, @hability), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @hability.update_attributes(hability_params)
			redirect_to edit_admin_area_function_hability_path(@area, @function, @hability), notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@hability.destroy

		redirect_to admin_area_function_habilities_path(@area, @function), notice: 'Removido com sucesso'
	end

	private
	def set_function
		@function = Function.find(params[:function_id])
		@area = @function.area
	end

	def set_hability
		@hability = @function.habilities.find(params[:id])
	end

	def hability_params
		params.require(:hability).permit(:name)
	end
end