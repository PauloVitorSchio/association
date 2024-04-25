class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @dashboard = Dashboard.new(current_user).charge
  end
end
