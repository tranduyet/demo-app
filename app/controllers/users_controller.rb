class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @user = User.new
    if @user.save
      @user = UserSerializer.new(@user, option={})
      render json: { data: { user: @user.as_json } }, status: 200
    else
      @user = ValidationErrorsSerializer.new(@user)
      render json: { data: { user: @user.as_json } }, status: 500
    end
  end
end
