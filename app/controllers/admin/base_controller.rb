class Admin::BaseController < ApplicationController

  layout 'admin'
  before_action :authenticate_user!

  protected

  def pipeline
    @pipeline = true
  end

  def remote_search
    @remote_search = true
  end

  #check if a user is allowed to access a certain topic
  def check_current_user_is_allowed? topic
    return true unless topic.private
    if topic.team_list.count > 0 and current_user.is_restricted? and (topic.team_list & current_user.team_list).count > 0
      puts 'allowed'
    else
      #TODO: throw not authorized
      puts '%%%% not allowed'
    end
  end

end
