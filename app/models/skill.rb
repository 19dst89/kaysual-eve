class Skill < ApplicationRecord
  has_many :character_skills
  has_many :toons, through: :character_skills
end
