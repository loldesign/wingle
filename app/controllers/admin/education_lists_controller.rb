class Admin::EducationListsController < AdminController
	before_action :set_education_list, except: [:new, :create, :index]

	def index
		@education_lists = EducationList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@education_list = EducationList.new
	end

	def create
		@education_list = EducationList.new(education_list_params)

		if @education_list.save
			redirect_to edit_admin_education_list_path(@education_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @education_list.update_attributes(education_list_params)
			redirect_to admin_education_lists_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@education_list.destroy

		redirect_to admin_education_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_education_list
		@education_list = EducationList.find(params[:id])
	end

	def education_list_params
		params.require(:education_list).permit(:name)
	end
end