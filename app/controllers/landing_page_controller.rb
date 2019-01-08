class LandingPageController < ApplicationController
  def session_type
    @header_options = {style: :with_login_button}
  end
end