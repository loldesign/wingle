class Admin::StatusListsController < AdminController
	before_action :set_status_list, except: [:new, :create, :index]

	def index
		@status_lists = StatusList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@status_list = StatusList.new
	end

	def create
		@status_list = StatusList.new(status_list_params)

		if @status_list.save
			redirect_to edit_admin_status_list_path(@status_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @status_list.update_attributes(status_list_params)
			redirect_to edit_admin_status_list_path(@status_list), notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@status_list.destroy

		redirect_to admin_status_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_status_list
		@status_list = StatusList.find(params[:id])
	end

	def status_list_params
		params.require(:status_list).permit(:name)
	end
end