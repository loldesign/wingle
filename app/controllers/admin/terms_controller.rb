class Admin::TermsController < AdminController
  before_action :set_term, except: [:new, :create, :index]

  def index
    @terms = Term.order(created_at: :desc).page(params[:page] || 1).per_page(30)
  end

  def show
  end

  def new 
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)

    if @term.save
      redirect_to edit_admin_term_path(@term), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @term.update_atttibutes(term_params)
      redirect_to edit_admin_term_path(@term), notice: 'Atualizado com sucesso'
    else
      render action: :edit
    end 
  end

  def destroy
    @term.destroy

    redirect_to admin_terms_path, notice: 'Removido com sucesso'
  end

  private
  def set_term
    @term = Term.find(params[:id])
  end

  def term_params 
    params.require(:term).permit(:title, :term)
  end
end
