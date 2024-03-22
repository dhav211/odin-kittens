module ImagePostsHelper
  def current_user_kitten_owner?(kitten)
    current_owner == kitten.owner
  end
end
