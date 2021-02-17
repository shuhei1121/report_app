class UsersController < ApplicationController

  def show
    @name = current_user.name
    @reports = current_user.reports
  end

end
