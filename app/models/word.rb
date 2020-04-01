class Word < ApplicationRecord
  has_one :pronunciation, dependent: :destroy
  has_many :meanings, dependent: :destroy
  has_many :examples, through: :meanings
  has_many :synonyms
  has_many :antonyms
  has_many :translation_histories, dependent: :destroy

  validates :name, presence: true

  before_create :update_vietnamese_meanings
  before_create :update_google_images

  private

  def update_vietnamese_meanings
    self.vn_meanings = MeaningService.update_mean_from_internet(name)
  end

  def update_google_images
    self.images = GoogleImageService.get_img_src(name)
  end
end
