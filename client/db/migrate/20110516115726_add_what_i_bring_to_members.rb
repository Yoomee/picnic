class AddWhatIBringToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :what_i_bring, :string
  end

  def self.down
    remove_column :members, :what_i_bring
  end
end
