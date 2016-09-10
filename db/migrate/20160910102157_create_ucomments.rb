class CreateUcomments < ActiveRecord::Migration
  def change
    create_table :ucomments do |t|
      t.text :body
      t.integer :score
      t.references :user, index: true, foreign_key: true
      t.references :photo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
