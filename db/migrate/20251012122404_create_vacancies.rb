class CreateVacancies < ActiveRecord::Migration[7.1]
  def change
    create_table :vacancies do |t|
      t.string :head
      t.text :description
      t.references :employer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
