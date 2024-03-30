class OwnersController < ApplicationController
  def show
    @owner = Owner.find_by id: params[:id]
  end

  def index
    if owner_signed_in?
      redirect_to current_owner
    else
      redirect_to new_owner_registration_path
    end
  end
end
