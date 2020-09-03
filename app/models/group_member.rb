class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :member

  scope :members, ->(group_id) { where(group_id: group_id).map(&:member) }
  scope :unmembers, ->(group_id) { Member.where.not(id: where(group_id: group_id).pluck(:member_id)) }
end
