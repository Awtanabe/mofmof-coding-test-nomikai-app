class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :member

  scope :members, ->(group_id) { where(group_id: group_id).map(&:member) }
  scope :unmembers, ->(group_id) { Member.where.not(id: where(group_id: group_id).pluck(:member_id)) }
  

  def self.chose_organizer(group_id)
    gm = GroupMember.where(group_id: group_id).select{|gm| gm.is_head_at.nil?}
    return [] if gm.blank?
    gm.shuffle.first
  end

  def set_organizer
    self.update!(is_head: true, is_head_at: Time.zone.now)
  end
end
