module Authenticable

  def current_api_user
    @current_api_user ||= User.find_by_token(request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" }, status: :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    current_api_user.present?
  end

end
