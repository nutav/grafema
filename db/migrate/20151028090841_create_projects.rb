class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :name, null: false
      t.belongs_to :category
      t.text   :description

      t.timestamps
    end

    add_attachment :projects, :picture
  end
end
