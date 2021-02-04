class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :format_id,  null: false
      t.integer :category_id,  null: false
      t.string :title,    null: false
      t.text :headline,   null: false 
      t.text :text,   null: false
      t.date :date,   null: false
      t.string :receiver
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
