class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :product, index: true
      t.string :description
      t.integer :rating
      t.timestamps null: false
    end
  end
end
