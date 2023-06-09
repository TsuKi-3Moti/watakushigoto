class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :user,   null: false, foreign_key: true
      t.string     :title,  null: false
      t.integer    :status, null: false, default: 0
      t.timestamps
    end
  end
end
