class CharacterSkill < ApplicationRecord
  belongs_to :skill_ref
  belongs_to :toon
end
