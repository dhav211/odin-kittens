module KittensHelper
  def kitten_owner_signed_in?(kitten_owner)
    kitten_owner.id == current_owner.id
  end

  def currrent_owner_following_kitten?(kitten)
    return false if current_owner.nil?

    !kitten.followers.find_by(owner_id: current_owner.id).nil?
  end

  def follow_or_unfollow_button(kitten, follower)
    return unless owner_signed_in?
    return if kitten_owner_signed_in?(kitten.owner)

    if currrent_owner_following_kitten?(kitten)
      button_to 'Unfollow', kitten_follower_path(kitten, follower), class: 'unfollow-button', method: :delete
    else
      button_to 'Follow', kitten_followers_path(kitten), class: 'follow-button'
    end
  end
end
