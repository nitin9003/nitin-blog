class CommentsController < ApplicationController
 
 layout 'admin'

 before_filter :confirm_logged_in
 before_filter :find_post

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def show
    @comment = Comment.find(params[:id])
    @posts = Post.order('position ASC')
  end

  def new
    @comment = Comment.new
  end

  def create
	@post = Post.find(params[:post_id])
	@post.comments.create(params[:comment])
	
  end

  def  edit
    @comment = Comment.find(params[:id])
    @posts = Post.order('position ASC')
  end
  
  def update
   # Find object using form parameters
    @comment = Comment.find(params[:id])
   # Update the object
    if @comment.update_attributes(params[:comment])
       # If update succeeds, redirect to the show action
       flash[:notice] = "comment Updated."
       redirect_to(:action => 'show', :id => @comment.id, :post_id => @comment.post_id)
    else
       # If save fails, redisplay the form so user can fix problems
        @posts = Post.order('positin ASC')
    	render('edit')
    end
  end

  def delete
    @comment = Comment.find(params[:id]) 
  end
 
  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "Comment Deleted."
    redirect_to(:action => 'list', :post_id => @post.id)
  end

  private
  def find_post
    if params[:post_id]
      @post = Post.find_by_id(params[:post_id])
    end
  end
end


