module ImagePostsHelper
  def current_user_kitten_owner?(kitten)
    current_owner == kitten.owner
  end

  def current_owner_liked_post?(post)
    return false if current_owner.nil?

    !post.likes.find_by(owner_id: current_owner.id).nil?
  end
end
