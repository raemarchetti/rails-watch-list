class List < ApplicationRecord

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, uniqueness: true, presence: true

  def validation_errors
    if errors.any?
      errors.full_messages.each do |message|
        Rails.logger.error(message)
      end
    end
  end
end
