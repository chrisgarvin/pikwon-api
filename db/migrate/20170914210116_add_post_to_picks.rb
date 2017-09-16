class AddPostToPicks < ActiveRecord::Migration[5.0]
  def change
    add_reference :picks, :post, foreign_key: true
  end
end
