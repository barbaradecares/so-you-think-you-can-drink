class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :video_url
      t.integer :drinks
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
