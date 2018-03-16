class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.references :createdby, references: :users
      t.references :assignedto, references: :users
      t.references :project, foreign_key: true
      t.string :title
      t.string :description
      t.date :deadline
      t.string :screenshot
      t.string :bug_type
      t.string :status

      t.timestamps
    end
    # Rails 5+ only: add foreign keys
    add_foreign_key :bugs, :users, column: :createdby_id, primary_key: :id
    add_foreign_key :bugs, :users, column: :assignedto_id, primary_key: :id
  end
end
