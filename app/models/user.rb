class User < ApplicationRecord
  has_secure_password

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  enum admin:{false:0,admin:1}

  def posts
    return Post.where(user_id: self.id)
  end

end
