class AddEnvironmentIdToTestSuites < ActiveRecord::Migration
  def change
    add_column :test_suites, :environment_id, :integer
  end
end
