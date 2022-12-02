class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def sender?(a_user)
    user.id == a_user.id
  end

  include PgSearch::Model
  pg_search_scope :search_by_content,
  against: [ :content],
  using: { tsearch: { prefix: true } }
end
