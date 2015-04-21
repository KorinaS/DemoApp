class Tweet < ActiveRecord::Base
	belongs_to :user
	has_one :user
	validates :text, presence: true, length: { maximum: 140 }
end

