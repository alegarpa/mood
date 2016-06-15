class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
    	t.string :status
    	t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :feelings, [:user_id, :created_at]
  end
end
