class UsersController < ApplicationController
  def show
    @user = User.find(params[:id0])
  end
end
