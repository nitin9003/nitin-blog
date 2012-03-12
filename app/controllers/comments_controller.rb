class CommentsController < ApplicationController
 
 layout 'admin'

 before_filter :confirm_logged_in
 before_filter :find_post

  def index
    list
    render('list')
  end

  def list
    @comments = Comment.order("comments.author ASC").where(:post_id => @post.id)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(:post_id => @post.id)
  end

  def create
  # Instantiate a new object using form parameters
    @comment = Comment.new(params[:comment])
  # Save the object
    if @comment.save
       # If save succeeds, redirect to the list action
       flash[:notice] = "Comment Posted."
       redirect_to(:action => 'list', :post_id => @comment.post_id)
    else
       # If save fails, redisplay the form so user can fix problems
       render('new')
    end
  end

  def  edit
    @comment = Comment.find(params[:id])
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
       render('edit')
    end
  end

  def delete
    @comment = Comment.find(params[:id]) 
  end
 
  def destroy
    Comment.find(params[:id]).destroy
    @comment.destroy
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


