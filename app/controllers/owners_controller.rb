class OwnersController < ApplicationController
  def show
    @owner = Owner.find_by id: params[:id]
    redirect_to show_owner_feed_path(@owner) if current_owner == @owner
  end

  def show_feed
    @owner = Owner.find_by id: params[:id]
    render :show if current_owner != @owner
  end

  def index
    if owner_signed_in?
      redirect_to current_owner
    else
      redirect_to new_owner_registration_path
    end
  end
end
