class Admin::LanguageLevelListsController < AdminController
	before_action :set_language_level_list, except: [:new, :create, :index]

	def index
		@language_level_lists = LanguageLevelList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@language_level_list = LanguageLevelList.new
	end

	def create
		@language_level_list = LanguageLevelList.new(language_level_list_params)

		if @language_level_list.save
			redirect_to edit_admin_language_level_list_path(@language_level_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @language_level_list.update_attributes(language_level_list_params)
			redirect_to admin_language_level_lists_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@language_level_list.destroy

		redirect_to admin_language_level_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_language_level_list
		@language_level_list = LanguageLevelList.find(params[:id])
	end

	def language_level_list_params
		params.require(:language_level_list).permit(:name)
	end
end