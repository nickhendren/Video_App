class AddMediaUrlToPost < ActiveRecord::Migration
  def change
    add_column :posts, :media_url, :text
  end
end
