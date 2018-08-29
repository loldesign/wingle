class Admin::RangeListsController < AdminController
	before_action :set_range_list, except: [:new, :create, :index]

	def index
		@range_lists = RangeList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@range_list = RangeList.new
	end

	def create
		@range_list = RangeList.new(range_list_params)

		if @range_list.save
			redirect_to edit_admin_range_list_path(@range_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @range_list.update_attributes(range_list_params)
			redirect_to edit_admin_range_list_path(@range_list), notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@range_list.destroy

		redirect_to admin_range_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_range_list
		@range_list = RangeList.find(params[:id])
	end

	def range_list_params
		params.require(:range_list).permit(:name)
	end
end