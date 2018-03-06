class Post < ApplicationRecord
  validates :title, {presence: true}
  validates :content , {presence: true}
  validates :user_id , {presence: true}

  enum status: { not:0, wip:1, done:2 }
  enum priority: { low:0, mid:1, high:2 }

  def user
    return User.find_by(id: self.user_id)
  end

  def self.search(search)
      if search
        Post.where(['title LIKE(?)', "%#{search}%"]) #検索とnameの部分一致を表示。
      else
        Post.all
      end
  end

end
