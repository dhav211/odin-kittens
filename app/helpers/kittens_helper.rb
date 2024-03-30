module KittensHelper
  def kitten_owner_signed_in?(kitten_owner)
    kitten_owner.id == current_owner.id
  end

  def currrent_owner_following_kitten?(kitten)
    return false if current_owner.nil?

    !kitten.followers.find_by(owner_id: current_owner.id).nil?
  end

  def follow_or_unfollow_button(owner, kitten, follower)
    return unless owner_signed_in?
    return if kitten_owner_signed_in?(kitten.owner)

    if currrent_owner_following_kitten?(kitten)
      button_to 'Unfollow', owner_kitten_follower_path(owner, kitten, follower), class: 'unfollow-button', method: :delete
    else
      button_to 'Follow', owner_kitten_followers_path(owner, kitten), class: 'follow-button'
    end
  end
end
