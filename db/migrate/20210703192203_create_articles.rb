class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :source
      t.text :body
      t.string :estimated_time

      t.timestamps
    end
  end
end
