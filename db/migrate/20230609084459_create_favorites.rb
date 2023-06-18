class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :user,   null: false, foreign_key: true
      t.integer    :design, null: false
      t.timestamps
    end
  end
end
