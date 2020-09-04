class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :member 

  scope :members, ->(group_id) { where(group_id: group_id).map(&:member) }
  scope :unmembers, ->(group_id) { Member.where.not(id: where(group_id: group_id).pluck(:member_id)) }
  

  def self.set_organizer(group_id)
    member = GroupMember.where(group_id: group_id).select{|gm| gm.is_organaizer_at.nil?}
    organizer = member.shuffle.first
    organizer.update(is_organaizer: true, is_organaizer_at: Time.zone.now)
    unorganizers = GroupMember.where("(group_id = ?) and (member_id != ?)", group_id, organizer.member_id)
    unorganizers.map{|unorganizer| unorganizer.update(is_organaizer: false, is_organaizer_at: nil)}
  end
end
