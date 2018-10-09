module ApplicationHelper
  def candidate_avatar(candidate, thumb_version=:thumb_large)
    has_image  = current_candidate.candidate_avatar.url.present?
    avatar     = has_image ? current_candidate.candidate_avatar.url(thumb_version) : 'icons/company.svg'

    content_tag :div, class: 'profile-image-box' do
      image_tag(avatar, class: has_image ? :with_image : :without_image)
    end
  end

  def candidate_welcome_message(candidate)
    if candidate.companies? || candidate.habilities?
      path = candidate.companies? ? candidate_company_step_1_path : candidate_hability_step_1_path
      link = 'Empresas e Habilidades'
    elsif candidate.education? || candidate.pretension?
      path = @candidate.education? ? candidate_education_step_1_path : candidate_pretension_step_1_path
      link = 'Educação e Pretensão.'
    end

    render partial: "/layouts/shared/candidate_welcome_message", locals: {candidate: candidate, link_text: link, link_path: path}
  end

  def display_term_status(term)
    status = {
      'published' => :success,
      'draft'     => :info,
      'archived'  => :default
    }

    content_tag :li, class: [:label, status[term.state] ] do
      term.aasm.human_state
    end
  end
end
