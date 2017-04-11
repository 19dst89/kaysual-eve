class AddReferencesToCharacterSkills < ActiveRecord::Migration[5.0]
  def change
    add_reference :character_skills, :toon, foreign_key: true
    add_reference :character_skills, :skill, foreign_key: true
  end
end
