class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user!(_options = {})
    head :unauthorized unless signed_in?
  end

  def authenticate_user
    return unless request.headers['Authorization'].present?

    token = request.headers['Authorization'].remove('Bearer ')
    @current_user = User.find_by(authentication_token: token)
  end

  attr_reader :current_user

  def signed_in?
    @current_user.present?
  end
end
