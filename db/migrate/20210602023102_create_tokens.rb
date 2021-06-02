class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.string :responsible
      t.string :hash_token

      t.timestamps
    end
  end
end
