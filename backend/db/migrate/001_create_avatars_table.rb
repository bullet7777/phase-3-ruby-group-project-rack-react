class CreateAvatarsTable < ActiveRecord::Migration[5.2]
    def change
      create_table :avatars do |t|
        t.string :name
        t.integer :category_id
      end
    end
  end
  