require 'date'

class UsersController < ApplicationController
  def new
    render "/users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_pleasant_string} .join("\n")
  end 
  
  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create 
    User.create!(
      first_name:params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password]
    )           
    redirect_to "/"
  end 
       
  def login
    id=params[:id]
    user=User.find(id)
    if user
        render plain: "true"
    else
        render plain: "false"
    end
  end
  
  def destroy
    id= params[:id]
    user = User.find(id)
    user.destroy
  end 

end
