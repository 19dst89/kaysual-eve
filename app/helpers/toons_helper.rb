module ToonsHelper

  def character_sheet(key_id, v_code, character_id)
    EveOnline::Characters::CharacterSheet.new(key_id, v_code, { character_id: character_id })
  end
end
