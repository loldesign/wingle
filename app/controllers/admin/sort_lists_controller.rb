class Admin::SortListsController < AdminController
	before_action :set_sort_list, except: [:new, :create, :index]

	def index
		@sort_lists = SortList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@sort_list = SortList.new
	end

	def create
		@sort_list = SortList.new(sort_list_params)

		if @sort_list.save
			redirect_to edit_admin_sort_list_path(@sort_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @sort_list.update_attributes(sort_list_params)
			redirect_to edit_admin_sort_list_path(@sort_list), notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@sort_list.destroy

		redirect_to admin_sort_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_sort_list
		@sort_list = SortList.find(params[:id])
	end

	def sort_list_params
		params.require(:sort_list).permit(:name)
	end
end