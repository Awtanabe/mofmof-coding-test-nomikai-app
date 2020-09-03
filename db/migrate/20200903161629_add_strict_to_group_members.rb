class AddStrictToGroupMembers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :group_members, :is_head, from: nil, to: false
  end
end
