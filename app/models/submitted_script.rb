class SubmittedScript < ApplicationRecord
  belongs_to :user
  belongs_to :listening_lesson
end
