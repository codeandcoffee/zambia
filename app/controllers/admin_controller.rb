class AdminController < ApplicationController
  def index
    if !current_user
      redirect_to log_in_url
    end
  end
end
