class AdminController < LoldesignPublisher::PublisherController
   before_action :authenticate_admin!
end
