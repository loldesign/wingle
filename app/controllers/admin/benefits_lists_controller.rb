class Admin::BenefitsListsController < AdminController
	before_action :set_benefits_list, except: [:new, :create, :index]

	def index
		@benefits_lists = BenefitsList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@benefits_list = BenefitsList.new
	end

	def create
		@benefits_list = BenefitsList.new(benefits_list_params)

		if @benefits_list.save
			redirect_to edit_admin_benefits_list_path(@benefits_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @benefits_list.update_attributes(benefits_list_params)
			redirect_to admin_benefits_lists_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@benefits_list.destroy

		redirect_to admin_benefits_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_benefits_list
		@benefits_list = BenefitsList.find(params[:id])
	end

	def benefits_list_params
		params.require(:benefits_list).permit(:name)
	end
end