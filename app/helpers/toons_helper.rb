module ToonsHelper

  def character_sheet(key_id, v_code, character_id)
    EveOnline::Characters::CharacterSheet.new(key_id, v_code, { character_id: character_id })
  end

  def all_skills(key_id, v_code, character_id)
    @sheet = EveOnline::Characters::CharacterSheet.new(key_id, v_code, { character_id: character_id })
    @skills_arr = []
    @sheet.skills.each do |skill|
      @skills_arr << skill
    end
  end

  def skill_names(key_id, v_code, character_id)

  end
end
