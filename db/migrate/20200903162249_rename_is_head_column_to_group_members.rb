class RenameIsHeadColumnToGroupMembers < ActiveRecord::Migration[6.0]
  def change
    rename_column :group_members, :is_head, :is_organaizer
    rename_column :group_members, :is_head_at, :is_organaizer_at
  end
end
