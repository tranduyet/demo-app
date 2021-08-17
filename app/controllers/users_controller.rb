class UsersController < ApplicationController
  def index
    @users = User.all
    @users = ActiveModelSerializers::SerializableResource.new(@users, option={})
    render json: { data: { users: @users.as_json } }, status: 200
  end
end
