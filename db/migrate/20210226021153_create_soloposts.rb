class CreateSoloposts < ActiveRecord::Migration[6.0]
  def change
    create_table :soloposts do |t|
      t.string     :nickname,              null: false
      t.text       :introduction,          null: false
      t.integer    :genre_id,              null: false
      t.integer    :musical_instrument_id, null: false
      t.integer    :area_id,               null: false
      t.string     :favorite_band
      t.string     :history
      t.text       :sns_account
      t.references :user,                  null: false, foreign_key: true

      t.timestamps
    end
  end
end
