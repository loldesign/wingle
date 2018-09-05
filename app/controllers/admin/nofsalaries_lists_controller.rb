class Admin::NofsalariesListsController < AdminController
	before_action :set_nofsalaries_list, except: [:new, :create, :index]

	def index
		@nofsalaries_lists = NofsalariesList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@nofsalaries_list = NofsalariesList.new
	end

	def create
		@nofsalaries_list = NofsalariesList.new(nofsalaries_list_params)

		if @nofsalaries_list.save
			redirect_to edit_admin_nofsalaries_list_path(@nofsalaries_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @nofsalaries_list.update_attributes(nofsalaries_list_params)
			redirect_to admin_nofsalaries_lists_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@nofsalaries_list.destroy

		redirect_to admin_nofsalaries_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_nofsalaries_list
		@nofsalaries_list = NofsalariesList.find(params[:id])
	end

	def nofsalaries_list_params
		params.require(:nofsalaries_list).permit(:name)
	end
end