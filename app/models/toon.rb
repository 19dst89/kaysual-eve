class Toon < ApplicationRecord
  belongs_to :user
  has_many :character_skills
  has_many :skill_refs, through: :character_skills
end
