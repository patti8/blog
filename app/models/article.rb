class Article < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :content, presence: true


  has_rich_text :content

  # Callbacks
  before_validation :generate_slug, on: :create

  # slug
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Scopes
  scope :published, -> { where.not(published_at: nil).where('published_at <= ?', Time.current).order(published_at: :desc) }

  private

  def generate_slug
    self.slug ||= title.parameterize if title.present?
  end
end
