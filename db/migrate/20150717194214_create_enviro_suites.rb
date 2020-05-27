class CreateEnviroSuites < ActiveRecord::Migration[6.0]
  def change
    create_table :enviro_suites do |t|
      t.integer :environment_id
      t.integer :test_suite_id

      t.timestamps
    end
  end
end
