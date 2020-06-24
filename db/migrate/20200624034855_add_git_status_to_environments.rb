class AddGitStatusToEnvironments < ActiveRecord::Migration[6.0]
  def change
    add_column :environments, :git_status, :string
  end
end
