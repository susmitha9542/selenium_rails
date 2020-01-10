class AddUserIdToResultSuites < ActiveRecord::Migration
  def change
    add_column :result_suites, :user_id, :integer
  end
end
