class AuthenticationController < ApplicationController
    skip_before_action :authenticate_user, only: [:login]

    # POST /login
    def login
        @user = User.find_by_email(params[:email])

        if @user&.authenticate(params[:password])

            token = JwtToken.encode(user_id: @user.id)
            
            expiration_time = 24.hours.from_now

            render json: {
                token: token,
                exp: expiration_time.strftime("%m-%d-%y %H:%M"),
                username: @user.user_name
            }, status: :ok # HTTP Status 200

        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end
end
