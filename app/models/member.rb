class Member < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members

  validates :name, presence: true

  def is_organaizer?(group_id)
    group_members.find_by(group_id: group_id).is_organaizer?
  end
end
