class LikesController < ApplicationController
  def create
    @kitten = Kitten.find_by id: params[:kitten_id]
    @owner = Owner.find_by id: params[:owner_id]
    @post = ImagePost.find_by id: params[:image_post_id]
    @post.likes.create! owner: current_owner
    redirect_to owner_kitten_image_post_path(@owner, @kitten, @post)
  end

  def destroy
    @kitten = Kitten.find_by id: params[:kitten_id]
    @owner = Owner.find_by id: params[:owner_id]
    @post = ImagePost.find_by id: params[:image_post_id]
    @like = @post.likes.find_by owner: current_owner
    @like.destroy
    redirect_to owner_kitten_image_post_path(@owner, @kitten, @post)
  end
end
