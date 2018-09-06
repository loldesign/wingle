class Admin::RelevancesController < AdminController
	before_action :set_relevance, except: [:new, :create, :index]

	def index
		@relevances = Relevance.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@relevance = Relevance.new
	end

	def create
		@relevance = Relevance.new(relevance_params)

		if @relevance.save
			redirect_to edit_admin_relevance_path(@relevance), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @relevance.update_attributes(relevance_params)
			redirect_to admin_relevances_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@relevance.destroy

		redirect_to admin_relevances_path, notice: 'Removido com sucesso'
	end

	private
	def set_relevance
		@relevance = Relevance.find(params[:id])
	end

	def relevance_params
		params.require(:relevance).permit(:name)
	end
end