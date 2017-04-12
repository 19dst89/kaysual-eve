class Toon < ApplicationRecord
  belongs_to :user
  has_many :character_skills
  has_many :skill_refs, through: :character_skills

  def eve_character
    @eve_character ||= eve_characters.first
  end

  def eve_character_id
    eve_character.character_id
  end

  def eve_portrait
    @eve_portrait ||= EveOnline::ESI::CharacterPortrait.new(eve_character.character_id)
  end

  def eve_account_balance
    @eve_account_balance ||= EveOnline::Characters::AccountBalance.new(key_id, v_code)
  end

  def eve_account_status
    @account_status ||= EveOnline::Account::Status.new(key_id, v_code)
  end

  def eve_character_sheet
    EveOnline::Characters::CharacterSheet.new(key_id, v_code, { character_id: eve_character_id })
  end

  private

    def eve_characters
      EveOnline::Account::Characters.new(key_id, v_code).characters
    end

end
