class AddFieldsToVacancy < ActiveRecord::Migration[7.1]
  def change
    add_column :vacancies, :salary_from, :integer
    add_column :vacancies, :salary_to, :integer
    add_column :vacancies, :full_description, :string
    add_column :vacancies, :phone, :string
    add_column :vacancies, :email, :string
    add_column :vacancies, :website, :string
  end
end
