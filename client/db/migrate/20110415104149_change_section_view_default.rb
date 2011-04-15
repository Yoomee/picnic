class ChangeSectionViewDefault < ActiveRecord::Migration
  def self.up
    change_column_default :sections, :view, "first_page"
    Section.view_is("normal").each{|s| s.update_attribute(:view, "first_page")}
  end

  def self.down
    change_column_default :sections, :view, "normal"
  end
end
