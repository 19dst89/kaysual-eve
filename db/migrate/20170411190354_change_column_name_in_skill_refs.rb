class ChangeColumnNameInSkillRefs < ActiveRecord::Migration[5.0]
  def change
    rename_column :character_skills, :skill_id, :skill_ref_id
  end
end
