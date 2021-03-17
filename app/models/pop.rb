class Pop < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  # def can_edit?(user)
  #   return user && @pop.user_id
  # end

  # # def can_edit?(user)
  # #   return user && user.has_role?(:admin)
  # # end
end
