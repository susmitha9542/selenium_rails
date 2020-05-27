class AddDefaultSuiteIdToEnvironments < ActiveRecord::Migration[6.0]
  def change
    add_column :environments, :default_suite_id, :integer
  end
end
