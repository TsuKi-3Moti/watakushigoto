class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false, foreign_key: true
      t.text    :opinion,     null: false
      t.timestamps
    end
  end
end
