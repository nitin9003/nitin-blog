class PostsController < ApplicationController

  layout 'admin'

 before_filter :confirm_logged_in

  def index
  list
  render('list')
  end
   

  def list
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
  # Instantiate a new object using form parameters
    @post = Post.new(params[:post])
  # Save the object
    if @post.save
       # If save succeeds, redirect to the list action
       flash[:notice] = "Post Created."
       redirect_to(:action => 'list')
    else
       # If save fails, redisplay the form so user can fix problems
       render('new')
    end
  end

  def  edit
    @post = Post.find(params[:id])
  end
  
  def update
   # Find object using form parameters
    @post = Post.find(params[:id])
   # Update the object
    if @post.update_attributes(params[:post])
       # If update succeeds, redirect to the show action
       flash[:notice] = "Post Updated."
       redirect_to(:action => 'show', :id => @post.id)
    else
       # If save fails, redisplay the form so user can fix problems
       render('edit')
    end
  end

  def delete
    @post = Post.find(params[:id]) 
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post Deleted."
    redirect_to(:action => 'list')
  end

end 

