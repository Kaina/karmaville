class UsersController < ApplicationController
  def index
    @users = Rails.cache.read 'users'
    if @users
    else
      @users = User.by_karma
      Rails.cache.write('users', @users)
    end
  end
end
