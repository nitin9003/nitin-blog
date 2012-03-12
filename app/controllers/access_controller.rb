class AccessController < ApplicationController

  layout 'admin'

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
   	# TODO: mark user as logged in
	flash[:notice] = "logged in as nitin9003."
	redirect_to(:action => "menu")
    else
	flash[:notice] = "Invalid username/password combination."
	redirect_to(:action => "login")
    end
  end

  def logout
  # TODO: mark user as logged out
	flash[:notice] = "Logged out"
	redirect_to(:action => "login")
  end
end
