class LandingPageController < ApplicationController
  def session_type
    @header_options = {style: :with_login_button}

    @area = Area.all
    @title_list = TitleList.order(priority: :asc)
  end
end