class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :answer, null: false, foreign_key: true
      t.references :tag,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
