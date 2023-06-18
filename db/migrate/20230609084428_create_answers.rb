class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.text       :opinion,  null: false
      t.integer    :status,   null: false, default: 0
      t.timestamps
    end
  end
end
