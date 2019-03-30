class CreateTagsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_users do |t|
      t.references :users
      t.references :tags

      t.timestamps
    end
  end
end
