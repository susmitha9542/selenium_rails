class CreateCaseSuites < ActiveRecord::Migration
  def change
    create_table :case_suites do |t|
      t.integer :test_case_id
      t.integer :test_suite_id
      t.integer :sequence

      t.timestamps
    end
  end
end
