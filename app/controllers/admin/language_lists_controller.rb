class Admin::LanguageListsController < AdminController
	before_action :set_language_list, except: [:new, :create, :index]

	def index
		@language_lists = LanguageList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@language_list = LanguageList.new
	end

	def create
		@language_list = LanguageList.new(language_list_params)

		if @language_list.save
			redirect_to edit_admin_language_list_path(@language_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @language_list.update_attributes(language_list_params)
			redirect_to admin_language_lists_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@language_list.destroy

		redirect_to admin_language_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_language_list
		@language_list = LanguageList.find(params[:id])
	end

	def language_list_params
		params.require(:language_list).permit(:name)
	end
end