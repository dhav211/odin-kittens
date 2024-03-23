class ImagePostsController < ApplicationController
  def new
    @post = ImagePost.new
  end

  def create
    @kitten = Kitten.find_by params[:kitten_id]
    @post = ImagePost.new allowed_params
    @post.kitten = @kitten
    @post.owner = @kitten.owner

    if @post.save
      redirect_to kitten_image_post_path(@kitten, @post), notice: 'Post added sucessfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = ImagePost.find params[:id]
    @kitten = @post.kitten
  end

  def edit
    @post = ImagePost.find params[:id]
  end

  def update
  end

  def destroy
    @post = ImagePost.find params[:id]
    @kitten = @post.kitten

    @post.destroy
    redirect_to @kitten, status: :see_other, notice: 'Post Deleted!'
  end

  private

  def allowed_params
    params.require(:image_post).permit(:body, :title, :image, :kitten_id, :owner)
  end
end
