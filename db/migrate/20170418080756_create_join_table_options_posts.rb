class CreateJoinTableOptionsPosts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :options, :posts do |t|
      t.index [:option_id, :post_id]
      t.index [:post_id, :option_id]
    end
  end
end
