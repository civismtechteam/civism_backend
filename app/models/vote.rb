class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user_id, uniqueness: { scope: [ :voteable_id, :voteable_type ] }

  after_save do
    voteable.update_vote_counts!
  end

end
