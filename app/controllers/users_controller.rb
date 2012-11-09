class UsersController < ApplicationController


  def index
    #authorize! :see, @user, :message => 'Your account is not activated yet, please contact Shervin.'
  	authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end


  def setup_role 
    if self.role_ids.empty?     
      self.role_ids = :new
    end
  end
end
