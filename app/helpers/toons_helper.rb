module ToonsHelper

  def all_skills(key_id, v_code, character_id)
    sheet = EveOnline::Characters::CharacterSheet.new(key_id, v_code, { character_id: character_id })
    sheet.skills
  end

  def skill_names_by_level(key_id, v_code, character_id)
    all_skills(key_id, v_code, character_id)
      .group_by(&:level)
      .sort
      .map do |level, skills|
        ids = skills.map(&:type_id)
        SkillRef.find(ids).pluck(:name) #TODO: slow b/c 6 bulk db queries
      end
  end

end
