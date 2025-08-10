class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :lead
      t.text :content
      t.datetime :published_at
      t.timestamps
      t.string :slug, null: false
    end
    add_index :articles, :slug, unique: true
  end
end
