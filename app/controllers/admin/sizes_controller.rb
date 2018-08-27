class Admin::SizesController < AdminController
	before_action :set_size, except: [:new, :create, :index]

	def index
		@sizes = Size.order(created_at: :desc).page(params[:page] || 1).per_page(30)
	end

	def show
	end

	def new
		@size = Size.new
	end

	def create
		@size = Size.new(size_params)

		if @size.save
			redirect_to edit_admin_size_path(@size), notice: 'Criado com sucesso'
		else
			render action: :new
		end
	end

	def edit
	end

	def update
		if @size.update_attributes(size_params)
			redirect_to edit_admin_size_path(@size), notice: 'Atualizado com sucesso'
		else
			render action: :edit
		end
	end

	def destroy
		@size.destroy

		redirect_to admin_sizes_path, notice: 'Removido com sucesso'
	end

	private
	def set_size
		@size = Size.find(params[:id])
	end

	def size_params
		params.require(:size).permit(:name, :description)
	end
end