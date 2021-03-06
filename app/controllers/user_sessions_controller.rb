class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = 'Signed in successfully.'
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = 'Signed out successfully.'
    redirect_to root_path
  end

end
