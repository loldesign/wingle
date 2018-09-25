class Candidate::MainController < ApplicationController
  before_action :authenticate_candidate!
  before_action :set_candidate

  def home
    @header_options = {style: :dashboard_header}
    @tab_bar        = {style: :with_tab_bar}

    @message = "COMPLETE SEU PERFIL PARA AVALIAR DESAFIOS NAS EMPRESAS DO SEU INTERESSE"
    case @candidate.signup_state
    when "companies", "habilities"
      path = @candidate.companies? ? candidate_company_step_1_path : candidate_hability_step_1_path
      link = "#{view_context.link_to 'Empresas e Habilidades', path}".html_safe
      @message = "Olá, eu sou o Wingle. Ajudarei você ao longo da sua carreira<br/><br/>"
      @message << "Entendi o que você busca e sua trajetória está quase finalizada. "
      @message << "Complete #{link} para evoluir na sua busca da empresa atual."
    when "education", "pretension"
      path = @candidate.education? ? candidate_education_step_1_path : candidate_pretension_step_1_path
      link = "#{view_context.link_to 'Educação e Pretensão.', path}".html_safe
      @message = "Quase lá. Para ser apresentado para as empresas certas preencha sua #{link}"
    when "complete"
      @message = "Acesse seu perfil para mais detalhes"
    end
  end

  def profile
    @header_options = {style: :dashboard_header}
    @tab_bar        = {style: :with_tab_bar}
  end

  private
    def set_candidate
      @candidate = current_candidate
    end
end