class DropEnviroSuites < ActiveRecord::Migration
  def up
    drop_table :enviro_suites
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
