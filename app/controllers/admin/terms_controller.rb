class Admin::TermsController < AdminController
  before_action :set_term, except: [:new, :create, :index, :publish]

  def index
    @terms           = Term.order(state: :desc, created_at: :desc).where.not(state: :published).page(params[:page] || 1).per_page(30)
    @terms_published = Term.order(created_at: :desc).published
  end

  def show
  end

  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)

    if @term.save
      TermPublishManager.new(term: @term).archive_terms_drafts

      redirect_to edit_admin_term_path(@term), notice: 'Criado com sucesso'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @term.update_attributes(term_params)
      if params[:publish_term].present?
        TermPublishManager.new(term: @term).process

        redirect_to admin_terms_path, notice: 'Publicado com sucesso'
      else
        redirect_to admin_terms_path, notice: 'Atualizado com sucesso'
      end
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
    params.require(:term).permit(:title, :term, :for)
  end
end
