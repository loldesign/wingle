class Admin::ModesController < AdminController
	before_action :set_mode, except: [:new, :create, :index]

	def index
		@modes = Mode.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@mode = Mode.new
	end

	def create
		@mode = Mode.new(mode_params)

		if @mode.save
			redirect_to edit_admin_mode_path(@mode), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @mode.update_attributes(mode_params)
			redirect_to admin_modes_path, notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@mode.destroy

		redirect_to admin_modes_path, notice: 'Removido com sucesso'
	end

	private
	def set_mode
		@mode = Mode.find(params[:id])
	end

	def mode_params
		params.require(:mode).permit(:name, :description, :score, :code)
	end
end