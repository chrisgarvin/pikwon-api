class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :option_text
      t.references :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
