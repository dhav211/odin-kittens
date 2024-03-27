class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    @owner = Owner.find_by id: params[:owner_id]
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new allowed_params

    if @kitten.save
      @kitten.images.attach params[:kitten][:main_image] if params.dig(:kitten, :main_image).present?
      redirect_to @kitten, notice: 'Your kitten has been added!'
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @kitten = Kitten.find_by id: params[:id]
    @owner = @kitten.owner
    @signed_in_owner = current_owner
    @follower = @kitten.followers.find_by owner_id:@signed_in_owner.id unless @signed_in_owner.nil?
  end

  def update
    @kitten = Kitten.find_by id: params[:id]

    return unless @kitten.update allowed_params

    @kitten.images.attach params[:kitten][:images] if params.dig(:kitten, :images).present?
    redirect_to @kitten
  end

  def set_main_image
    @kitten = Kitten.find_by id: params[:kitten_id]
    post = ImagePost.find_by id: params[:id]
    @kitten.update(main_image_id: post.image.id)
    redirect_to @kitten
  end

  def set_profile_picture
    @kitten = Kitten.find_by id: params[:kitten_id]
    post = ImagePost.find_by id: params[:id]
    #@kitten.update(profile_picture: )
  end

  private

  def allowed_params
    params.require(:kitten).permit(:name, :images, :profile_picture)
  end
end
