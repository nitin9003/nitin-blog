class PublicController < ApplicationController
  
 # layout 'public'
  before_filter :setup_navigation
  

  def index 
    #Intro Text 
  end

   def show
   @post = Post.where(:id => params[:id]).first
   redirect_to(:action => 'index') unless @post
  end
   
  def new
    @comment = Comment.new()
  end

# :post_id => @post.id

  def create
    # Instantiate a new object using form parameters
	@post = Post.find(params[:id])
    @comment = Comment.new(params[:comment])
    # Save the object
    if @comment.save
       # If save succeeds, redirect to the list action
     @post.comments << @comment
      redirect_to(:action => 'show')

#  :post_id => @comment.post_id
    
    else
       # If save fails, redisplay the form so user can fix problems
       render('new')
    end
  end


 private
  
  def setup_navigation
    @posts = Post.all
  end

end
