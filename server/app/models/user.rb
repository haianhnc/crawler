class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :LikedArticles

  # validates :user_name, presence: true, length: {maximum: 255}
  validates :password, presence: true, length: {maximum: 255}

  def isLiked? article_id
    aa = LikedArticle.where(user_id: self.id, article_id: article_id)
    aa.count == 0
  end

  def countLiked article_id
    LikedArticle.where(article_id: article_id).count.to_s
  end

end
