class ListeningLesson < ApplicationRecord
  has_many :submitted_scripts

  validates :name, :link, presence: true

  def script_submitted_by?(user)
    script = self.submitted_scripts.find_by(user: user)
    !!script
  end
end
