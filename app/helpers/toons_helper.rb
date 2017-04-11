module ToonsHelper

  def character_sheet(key_id, v_code, character_id)
    EveOnline::Characters::CharacterSheet.new(key_id, v_code, { character_id: character_id })
  end

  def all_skills(key_id, v_code, character_id)
    @sheet = EveOnline::Characters::CharacterSheet.new(key_id, v_code, { character_id: character_id })
    @skills = []
    @sheet.skills.each do |skill|
      @skills << skill
    end
  end
end
