class PublicController < ApplicationController
  
  layout 'public'
  before_filter :setup_navigation
  

  def index 
    #Intro Text 
  end

   def show
   @post = Post.where(:id  =>  params[:id]).first
   redirect_to(:action => 'index') unless @post
  end


 private
  
  def setup_navigation
    @posts = Post.all
  end

end
