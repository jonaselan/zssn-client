class HomeController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @survivors_index = Requester.get("#{ENV['API']}/survivors")
  end
end
