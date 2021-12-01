class Playdate < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    validates :title, presence: true
    scope :most_appointments, -> { find(joins(:reviews).group(:playdate_id).order('count_playdate_id desc').count('playdate_id').first[0]) }
    
end
