class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @bandposts = current_user.bandposts
    @soloposts = current_user.soloposts
  end
end
