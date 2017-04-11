class RenameSkillTableToSkillRef < ActiveRecord::Migration[5.0]
  def change
    rename_table :skills, :skill_refs
  end
end
