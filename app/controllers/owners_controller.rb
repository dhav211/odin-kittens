class OwnersController < ApplicationController
  def show
    @owner = Owner.find_by id: params[:id]
  end
end
