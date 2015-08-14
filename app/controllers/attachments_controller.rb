class AttachmentsController < ApplicationController

def show
   @attachments = @post.attachments.all
end

def new
   @post = Post.new
   @attachment = @post.attachments.build
end

def create
   @post = Post.new(post_params)

   respond_to do |format|
     if @post.save
       params[:attachments]['avatar'].each do |a|
          @attachment = @post.attachments.create
     else
        render action: 'new' 
     end
   end
 end

private
  def post_params
      params.require(:post).permit(:user_id, :post_id, :avatar, :imageable,:name,:imageable_id,:imageable_type)
  end

end
