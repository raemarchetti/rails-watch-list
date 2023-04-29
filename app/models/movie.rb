class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks

  validates :title, :overview, uniqueness: true, presence: true

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    if self.bookmarks
      errors.add(:base, 'Cannot delete movie referenced in a bookmark')
      raise ActiveRecord::InvalidForeignKey.new(self)
    end
  end
end
