class ImagePostsController < ApplicationController
  def new
    @post = ImagePost.new
  end

  def create
    @kitten = Kitten.find_by id: params[:kitten_id]
    @owner = Owner.find_by id: params[:owner_id]
    @post = ImagePost.new allowed_params
    @post.kitten = @kitten
    @post.owner = @owner

    if @post.save
      redirect_to owner_kitten_image_post_path(@owner, @kitten, @post), notice: 'Post added sucessfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = ImagePost.find_by id: params[:id]
    @kitten = Kitten.find_by id: params[:kitten_id]
    @owner = Owner.find_by id: params[:owner_id]
  end

  def edit
    @post = ImagePost.find params[:id]
  end

  def update
    @post = ImagePost.find params[:id]
    @kitten = @post.kitten
    @owner = @kitten.owner

    if @post.update allowed_params
      redirect_to owner_kitten_image_post_path(@owner, @kitten, @post), notice: 'Post edited sucessfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = ImagePost.find_by id: params[:id]
    @kitten = Kitten.find_by id: params[:kitten_id]
    @owner = Owner.find_by id: params[:owner_id]

    @post.destroy
    redirect_to owner_kitten_path(@owner, @kitten), notice: 'Post Deleted!', status: :see_other
  end

  private

  def allowed_params
    params.require(:image_post).permit(:body, :title, :image, :kitten_id, :owner)
  end
end
