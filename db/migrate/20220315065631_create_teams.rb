class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :news_title,   null: false
      t.text   :news_text,    null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
