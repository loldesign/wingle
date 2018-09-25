class Admin::AnnualClaimRateListsController < AdminController
	before_action :set_annual_claim_rate_list, except: [:new, :create, :index]

	def index
		@annual_claim_rate_lists = AnnualClaimRateList.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@annual_claim_rate_list = AnnualClaimRateList.new
	end

	def create
		@annual_claim_rate_list = AnnualClaimRateList.new(annual_claim_rate_list_params)

		if @annual_claim_rate_list.save
			redirect_to edit_admin_annual_claim_rate_list_path(@annual_claim_rate_list), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @annual_claim_rate_list.update_attributes(annual_claim_rate_list_params)
			redirect_to admin_annual_claim_rate_lists_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@annual_claim_rate_list.destroy

		redirect_to admin_annual_claim_rate_lists_path, notice: 'Removido com sucesso'
	end

	private
	def set_annual_claim_rate_list
		@annual_claim_rate_list = AnnualClaimRateList.find(params[:id])
	end

	def annual_claim_rate_list_params
		params.require(:annual_claim_rate_list).permit(:name, :value)
	end
end