class Toon < ApplicationRecord
  belongs_to :user
  has_many :character_skills
  has_many :skill_refs, through: :character_skills

  def eve_character
    @eve_character ||= eve_characters.first
  end

  def eve_portrait
    @eve_portrait ||= EveOnline::ESI::CharacterPortrait.new(eve_character.character_id)
  end

  private

    def eve_characters
      EveOnline::Account::Characters.new(key_id, v_code).characters
    end

end
