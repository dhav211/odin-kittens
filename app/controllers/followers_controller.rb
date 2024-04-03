class FollowersController < ApplicationController
  def create
    @owner = Owner.find_by id: params[:owner_id]
    @kitten = Kitten.find_by id: params[:kitten_id]
    @kitten.followers.create! owner: current_owner
    redirect_to owner_kitten_path(@owner, @kitten), notice: "You\'re now following #{@kitten.name}"
  end

  def destroy
    @kitten = Kitten.find_by id: params[:kitten_id]
    @follower = @kitten.followers.find_by id: params[:id]
    @follower.destroy if current_owner
    redirect_to owner_kitten_path(current_owner, @kitten), notice: "You\'re no longer following #{@kitten.name}"
  end
end
