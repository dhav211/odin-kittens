class KittensController < ApplicationController
  before_action :authenticate_owner!, only: %i[new create update]
  before_action :correct_owner_signed_in, only: %i[new create update]

  def index
    @kittens = Kitten.all
    @owner = Owner.find_by id: params[:owner_id]
  end

  def new
    @kitten = Kitten.new
    @owner = Owner.find_by id: params[:owner_id]
  end

  def create
    @kitten = Kitten.new allowed_params
    @kitten.owner = Owner.find_by id: params[:owner_id]

    if @kitten.save
      attach_inital_profile_picture(@kitten) if params.dig(:kitten, :profile_picture).present?
      redirect_to owner_kitten_path(@kitten.owner, @kitten), notice: 'Your kitten has been added!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @kitten = Kitten.find_by id: params[:id]
    @owner = @kitten.owner
    @signed_in_owner = current_owner
    @follower = @kitten.followers.find_by owner_id: @signed_in_owner.id unless @signed_in_owner.nil?
  end

  def edit
    @kitten = Kitten.find_by id: params[:id]
    @owner = Owner.find_by id: params[:owner_id]
  end

  def update
    @kitten = Kitten.find_by id: params[:id]
    return unless @kitten.update allowed_params

    @kitten.images.attach params[:kitten][:images] if params.dig(:kitten, :images).present?
    redirect_to owner_kitten_path(@kitten.owner, @kitten)
  end

  def set_profile_picture
    @kitten = Kitten.find_by id: params[:kitten_id]
    post = ImagePost.find_by id: params[:id]
    @kitten.profile_picture.attach post.image_blob
    @kitten.save
  end

  private

  def allowed_params
    params.require(:kitten).permit(:name, :images, :date_of_birth, :color, :gender, :profile_picture_id)
  end

  def correct_owner_signed_in
    @owner = Owner.find_by(id: params[:owner_id])
    return if current_owner == @owner

    redirect_to @owner, alert: "You\'re not this user!"
  end

  def attach_inital_profile_picture(kitten)
    post = kitten.image_posts.create(owner: kitten.owner, kitten: kitten)
    post.image.attach params[:kitten][:profile_picture]
    post.save
  end
end
