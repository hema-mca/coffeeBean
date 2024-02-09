class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string     :type, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
