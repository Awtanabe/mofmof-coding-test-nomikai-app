class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members

  validate :at_least_one_member

  private

  def at_least_one_member
    return if members.size > 0
    
    errors.add(:member_ids, 'を、最低一人は選択してください')
  end
end
