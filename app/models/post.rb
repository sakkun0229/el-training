class Post < ApplicationRecord
  validates :title, {presence: true}
  validates :content , {presence: true}
  validates :user_id , {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

  def self.search(search) #ここでのself.はUser.を意味する
      if search
        Post.where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。
      else
        Post.all #全て表示。
      end
    end

end
