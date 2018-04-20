class UsersController < ApplicationController
  def index
  end

  def main
    @user = User.find_by(email: params[:login_email])
    @email = session[:email] 
    @name = session[:user] 
    @id = session[:id] 

    @org = Organization.all
    @ref = session[:org]
    puts '---------------------'
    puts @name
    puts @email
    puts @id
    puts '---------------------'
  end

  def view
    @org = Organization.find(params[:id])
    puts '---------------------'
    puts session[:user]
    puts session[:email]
    puts session[:id]
    puts '---------------------'
    @user = User.find_by(name:session[:user])
    @mems = @org.members
  end

  def edit
  end

  def delete
    @org = Organization.find(params[:id])
    @org.destroy
    redirect_to '/home'
  end

  def leave
    @user = User.find(session[:id])
    @mem = Organization.find(params[:id])
    @ref = @mem.members.find_by(user_id: @user.id)
    if @ref == nil
      session[:org] = @ref
      redirect_to '/home'
    else
      @ref.destroy
      redirect_to '/home'
    end
  end

  def new
    @org = Organization.new(name:params[:name], description:params[:description], user_id:params[:id])
    @org.save
    @user = User.find(params[:id])
    @mem = Member.new(organization_id:@org.id, user_id:@user.id)
    @mem.save
    redirect_to '/home'
  end

  def join
    @user = User.find_by(email: session[:email])
    @org = Organization.find(params[:id])
    if @org.members.find_by(user_id:@user.id)
      redirect_to '/home'
    else
      m = Member.new(organization_id:params[:id], user_id:@user.id)
      m.save
      redirect_to '/home'
    end
  end

  def login 
    if User.find_by(email: params[:login_email]).try(:authenticate, params[:login_password])
      @user = User.find_by(email: params[:login_email])
      session[:email] = @user.email
      session[:user] = @user.name
      session[:id] = @user.id
      redirect_to '/home'
    else
      reset_session
      flash[:errors] = "Email or Password incorrect"
      redirect_to root_path
    end

  end

 
  def create 
    @user = User.create(user_params)
    if @user.valid? 
      @user.save
      session[:email] = @user.email
      session[:user] = @user.name
      session[:id] = @user.id
      redirect_to '/home'
    else
      reset_session
      flash[:errors] = "Error in fields"
      redirect_to root_path
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :con_create_password)
    end
end
