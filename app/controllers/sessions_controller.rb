class SessionsController < ApplicationController

  def new
    @user=User.new
  end

 def create
   @user = User.find_by mail: params[:session][:mail]
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Login success"
      log_in(@user)
      redirect_to product_index_path
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
 end

 def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
