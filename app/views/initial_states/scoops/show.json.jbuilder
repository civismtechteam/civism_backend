comment_json = Proc.new do |comment|
  json.extract! comment, *Comment.whitelisted_columns
  json.comments do
    json.array! comment.comments do |sub_comment|
      comment_json.call(sub_comment)
    end
  end
end

json.scoop do
  json.extract! @scoop, *Scoop.whitelisted_columns
end

json.facts do
  json.array! @scoop.facts do |fact|
    json.extract! fact, *Fact.whitelisted_columns
    json.comments do
      json.array! fact.comments do |comment|
        comment_json.call(comment)
      end
    end
  end
end

json.perspectives do
  json.array! @scoop.perspectives do |perspective|
    json.extract! perspective, *Perspective.whitelisted_columns
    json.comments do
      json.array! perspective.comments do |comment|
        comment_json.call(comment)
      end
    end
  end
end

json.users do
  User.all.each do |user|
    json.set! user.id do
      json.extract! user, *User.whitelisted_columns
    end
  end
end
