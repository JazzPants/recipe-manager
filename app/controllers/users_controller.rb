class UsersController < ApplicationController
    def new
      
    end
  
    # def create
    #   @user = User.new(user_params)
    #   return redirect_to controller: 'users', action: 'new' unless @user.save
    #   session[:user_id] = @user.id
    #   redirect_to controller: 'welcome', action: 'home'
    # end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'welcome', action: 'home'
      else
        render :new
      end
    end
  
    
    private
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
  end