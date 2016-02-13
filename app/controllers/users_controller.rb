class UsersController < ApplicationController


  #this is a filter
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]

def index
    @users = User.paginate(page: params[:page])
end


 def show
 	@user = User.find(params[:id])
  @microposts = @user.microposts.paginate(page: params[:page])
 	#debugger
 end


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user

  	else
  		render 'new'
  	end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # @user.update_attribute(:login_count, 1)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  




  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end


end
class UsersController < ApplicationController


  #this is a filter
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]

def index
    @users = User.paginate(page: params[:page])
end


 def show
 	@user = User.find(params[:id])
 	#debugger
 end


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		flash[:success] = "You're on your way to finding some feels!"
  		redirect_to @user

  	else
  		render 'new'
  	end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # @user.update_attribute(:login_count, 1)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  




  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end


end
