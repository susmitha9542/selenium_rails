class CreateResultsDictionaries < ActiveRecord::Migration
  def change
    create_table :results_dictionaries do |t|
      t.text :description

      t.timestamps
    end
  end
end
