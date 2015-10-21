class AddVideoToPins < ActiveRecord::Migration
  def change
  	add_column :pins, :video_link, :string
  end
end
