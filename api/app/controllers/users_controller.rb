class UsersController < ApplicationController
  def create
    user = UserCreator.create(user_params)

    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone)
  end
end
