class Tweet < ActiveRecord::Base
	belongs_to :user
	has_one :user
	validates :text, presence: true, length: { maximum: 140 }
	validates :timer_not_in_past, presence: true

	def timer_not_in_past
		if timer?
			errors.add(:timer, " has already passed!") if timer <= Time.now
		end
		true
	end
end

