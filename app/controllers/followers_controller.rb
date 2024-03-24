class FollowersController < ApplicationController
  def create
    @kitten = Kitten.find_by id: params[:kitten_id]
    @kitten.followers.create! owner: current_owner
    redirect_to @kitten, notice: "You\'re now following #{@kitten.name}"
  end

  def destroy
    @kitten = Kitten.find_by id: params[:kitten_id]
    @follower = @kitten.followers.find_by id: params[:id]
    @follower.destroy if current_owner
    redirect_to @kitten, notice: "You\'re no longer following #{@kitten.name}"
  end
end
