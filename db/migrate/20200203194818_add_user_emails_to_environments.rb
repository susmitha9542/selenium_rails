class AddUserEmailsToEnvironments < ActiveRecord::Migration[6.0]
  def change
    add_column :environments, :user_emails, :text
  end
end
