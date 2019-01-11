class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :lede
      t.text :body
      t.string :author
      t.date :date

      t.timestamps
    end
  end
end
