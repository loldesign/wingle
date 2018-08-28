class Admin::FunctionsController < AdminController
	before_action :set_area
	before_action :set_function, except: [:new, :create, :index]

	def index
		@functions = @area.functions.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@function = Function.new
	end

	def create
		@function = @area.functions.build(function_params)

		if @function.save
			redirect_to edit_admin_area_function_path(@area, @function), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @function.update_attributes(function_params)
			redirect_to edit_admin_area_function_path(@area, @function), notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@function.destroy

		redirect_to admin_area_functions_path(@area), notice: 'Removido com sucesso'
	end

	private
	def set_area
		@area = Area.find(params[:area_id])
	end

	def set_function
		@function = @area.functions.find(params[:id])
	end

	def function_params
		params.require(:function).permit(:name)
	end
end