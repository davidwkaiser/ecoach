class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.string :utterance
      t.references :conversation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end