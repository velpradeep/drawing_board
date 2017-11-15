module Concerns::UserAutoGeneration
  extend ActiveSupport::Concern

  included do
    before_action :set_user
  end

  def set_user
    user_ip_address = request.remote_ip
    @user = User.where(ip_address: user_ip_address).first
    @user = @user.blank? ? User.create(ip_address: user_ip_address) : @user
  end

end