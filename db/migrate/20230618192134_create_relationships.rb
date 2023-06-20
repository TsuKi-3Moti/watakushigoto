class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :answer_id, null: false, foreign_key: true
      t.integer :tag_id,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
