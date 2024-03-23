class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new allowed_params

    if @kitten.save
      redirect_to @kitten, notice: 'Your kitten has been added!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @kitten = Kitten.find_by id: params[:id]
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

  private

  def allowed_params
    params.require(:kitten).permit(:name, :main_image)
  end
end
