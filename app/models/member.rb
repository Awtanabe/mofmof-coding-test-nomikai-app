class Member < ApplicationRecord
  has_many :group_members
  has_many :groups, through: :group_members

  def is_head?(group_id)
    group_members.find_by(group_id: group_id).is_head?
  end
end
