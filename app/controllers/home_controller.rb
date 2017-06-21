class HomeController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @survivors = Requester.get("#{ENV['API']}/survivors")
  end
end
