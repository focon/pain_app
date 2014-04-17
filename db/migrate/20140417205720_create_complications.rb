class CreateComplications < ActiveRecord::Migration
  def change
    create_table :complications do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
