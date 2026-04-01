class CreateAuditLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :audit_logs do |t|
      t.references :account, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.references :auditable, polymorphic: true, null: false
      t.string :action, null: false
      t.jsonb :audited_changes, default: {}
      t.string :ip_address

      t.timestamps
    end
    
    add_index :audit_logs, [:account_id, :action]
  end
end
