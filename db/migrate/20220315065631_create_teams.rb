class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :news_name
      t.string :news_title
      t.text   :news_text
      t.text   :news_image
      t.timestamps
    end
  end
end
