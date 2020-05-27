class DropEnviroSuites < ActiveRecord::Migration[6.0]
  def up
    drop_table :enviro_suites
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
