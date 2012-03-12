class AccessController < ApplicationController

  layout 'admin'

  before_filter :confirm_logged_in, :except =>[:login, :logout, :attempt_login]
 
  def index
   menu
   render('menu')
  end

  def menu
  # display text and links
  end
  
  def login
  # login form
  end

  def attempt_login
    authorized_a = Admin.authenticate(params[:username], params[:password])
    if authorized_a
   	session[:a_id] = authorized_a.id
        session[:username] = authorized_a.username
	flash[:notice] = "You are now logged in."
	redirect_to(:action => "menu")
    else
	flash[:notice] = "Invalid username/password combination."
	redirect_to(:action => "login")
    end
  end

  def logout
        session[:a_id] = nil
        session[:username] = nil
	flash[:notice] = "Logged out"
	redirect_to(:action => "login")
  end
  
 


end
