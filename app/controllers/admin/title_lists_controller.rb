class Admin::TitleListsController < AdminController
	before_action :set_title_list, except: [:new, :create, :index]

	def index
		@title_lists = TitleList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@title_list = TitleList.new
	end

	def create
		@title_list = TitleList.new(title_list_params)

		if @title_list.save
			redirect_to edit_admin_title_list_path(@title_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @title_list.update_attributes(title_list_params)
			redirect_to edit_admin_title_list_path(@title_list), notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@title_list.destroy

		redirect_to admin_title_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_title_list
		@title_list = TitleList.find(params[:id])
	end

	def title_list_params
		params.require(:title_list).permit(:name)
	end
end