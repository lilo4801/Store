class UsersController < ApplicationController

  def new
    @user=User.new
  end
  def edit
     @user=User.find_by(params[:id])
  end
  def create
    @user=User.new(user_params)
    if @user.save
     flash[:success] = "Register success"
     redirect_to users_path
   else
     flash[:success] = "Register failed"
     render :new
   end
   def update
     @user=User.find_by(params[:id])
     if @user.update(user_params)
       flash[:notice]='User was updated'
       redirect_to users_path
     else
        flash[:notice]='User was not updated'
        render :edit
     end
   end
  end
  private
    def user_params
      params.require(:user).permit(:mail,:password,:password_confirmation)
    end
  end
