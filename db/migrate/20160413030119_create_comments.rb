class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string     :content
      t.integer    :commentable_id
      t.string     :commentable_type
      t.references :user

      t.timestamps
    end

    add_index :comments, :commentable_id
  end
end
