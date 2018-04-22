module Api

  class SessionsController < Api::BaseController

    def create
      email = params[:email]
      password = params[:password]

      if email.nil? || password.nil?
        render json: { error: 'Email ou Senha invalidos.' }, status: :unprocessable_entity
      else
        user = User.find_by(email: email)
        if !user.nil? && user.valid_password?(password)
          session = UserSession.new
          user.user_sessions << session
          serialized_user = UserSerializer.new(user, {})
          render json: { token: session.token, user: serialized_user }, status: :ok
        else
          render json: { error: "Email ou Senha invalidos." }, status: :unprocessable_entity
        end
      end
    end

    def destroy
    token = request.headers['Authorization']
    session = UserSession.find_by(token: token)
    if !session.nil?
      session.destroy
      head 204
    else
      render json: { error: 'Token invalido' }, status: :unprocessable_entity
    end
  end

  end

end
