class Admin::StepListsController < AdminController
	before_action :set_step_list, except: [:new, :create, :index]

	def index
		@step_lists = StepList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@step_list = StepList.new
	end

	def create
		@step_list = StepList.new(step_list_params)

		if @step_list.save
			redirect_to edit_admin_step_list_path(@step_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @step_list.update_attributes(step_list_params)
			redirect_to admin_step_lists_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@step_list.destroy

		redirect_to admin_step_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_step_list
		@step_list = StepList.find(params[:id])
	end

	def step_list_params
		params.require(:step_list).permit(:name)
	end
end