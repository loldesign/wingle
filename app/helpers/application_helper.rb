module ApplicationHelper
  def candidate_avatar(candidate, thumb_version=:thumb_large)
    has_image  = current_candidate.candidate_avatar.url.present?
    avatar     = has_image ? current_candidate.candidate_avatar.url(thumb_version) : 'icons/company.svg'

    content_tag :div, class: 'profile-image-box' do
      image_tag(avatar, class: has_image ? :with_image : :without_image)
    end
  end
end
