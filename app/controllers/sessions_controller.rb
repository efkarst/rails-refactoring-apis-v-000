class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    
    token = GithubService.new.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:token] = token

    redirect_to '/'
  end
end