class Admin::CompanySizesController < AdminController
	before_action :set_company_size, except: [:new, :create, :index]

	def index
		@company_sizes = CompanySize.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@company_size = CompanySize.new
	end

	def create
		@company_size = CompanySize.new(company_size_params)

		if @company_size.save
			redirect_to edit_admin_company_size_path(@company_size), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @company_size.update_attributes(company_size_params)
			redirect_to edit_admin_company_size_path(@company_size), notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@company_size.destroy

		redirect_to admin_company_sizes_path, notice: 'Removido com sucesso'
	end

	private
	def set_company_size
		@company_size = CompanySize.find(params[:id])
	end

	def company_size_params
		params.require(:company_size).permit(:name, :description, :score)
	end
end