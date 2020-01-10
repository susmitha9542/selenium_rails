class AddDefaultSuiteIdToEnvironments < ActiveRecord::Migration
  def change
    add_column :environments, :default_suite_id, :integer
  end
end
