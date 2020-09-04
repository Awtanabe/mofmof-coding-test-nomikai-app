class CreateGroupMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_members do |t|
      t.references :group, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.boolean :is_head, defalut: false
      t.datetime :is_head_at
      t.timestamps
    end
  end
end
