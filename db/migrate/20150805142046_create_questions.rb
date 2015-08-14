class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :que
      t.integer :answer_id
      t.string :ans

      t.timestamps null: false
    end
  end
end
