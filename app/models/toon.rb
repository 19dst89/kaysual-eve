class Toon < ApplicationRecord
  belongs_to :user
  has_many :character_skills
  has_many :skills, through: :character_skills
end
