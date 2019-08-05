class DynamicPagesController < ApplicationController
  def welcome
    @user_first_name = params[:user_first_name]
  end
end
