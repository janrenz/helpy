# NOTE: This is currently not used, but does have a working view.

class Admin::DashboardController < Admin::BaseController

  before_action :verify_admin_or_agent
  
  def dashboard
    @topics = Topic.mine(current_user.id).pending.page params[:page]
  end

end
