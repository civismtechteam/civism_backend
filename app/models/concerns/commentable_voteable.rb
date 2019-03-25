require 'active_support/concern'

module CommentableVoteable
  extend ActiveSupport::Concern

  included do
    scope :smart_sort, -> { order('num_comments + num_upvotes DESC') }

    def update_comment_count!
      self.num_comments = comments.count
      self.save!
    end

    def update_vote_comment_counts!
      self.num_upvotes = votes.where(direction: 1).count
      self.num_downvotes = votes.where(direction: -1).count
      self.save!
    end
  end

end
