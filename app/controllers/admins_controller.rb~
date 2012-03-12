class AdminsController < ApplicationController

  layout 'admin'

  def index
  list
  render('list')
  end
  

  def list
   @admins = Admin.all
  end


  def new
    @admin = Admin.new
  end


  def create
  # Instantiate a new object using form parameters
    @admin = Admin.new(params[:admin])
  # Save the object
    if @admin.save
       # If save succeeds, redirect to the list action
       flash[:notice] = "Admin Created."
       redirect_to(:action => 'list')
    else
       # If save fails, redisplay the form so user can fix problems
       render('new')
    end
  end


  def edit
   @admin = Admin.find(params[:id])
  end


  def update
  # Find object using form parameters
    @admin = Admin.find(params[:id])
  # Update the object
    if @admin.update_attributes(params[:admin])
       # If update succeeds, redirect to the show action
       flash[:notice] = "Admin Updated."
       redirect_to(:action => 'list')
    else
       # If save fails, redisplay the form so user can fix problems
       render('edit')
    end
  end
 

  def delete
    @admin = Admin.find(params[:id]) 
  end


  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    flash[:notice] = "Admin Deleted."
    redirect_to(:action => 'list')
  end

end
