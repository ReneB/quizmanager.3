class CreateLearnables < ActiveRecord::Migration
  def change
    create_table :learnables do |t|
      t.string :name
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
