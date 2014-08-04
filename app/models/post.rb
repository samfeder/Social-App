class Post < ActiveRecord::Base
  belongs_to :author, :inverse_of => :posts,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  has_many :links, :inverse_of => :post,
    class_name: "Link",
    foreign_key: :post_id,
    primary_key: :id

  has_many :post_shares, :inverse_of => :post,
    class_name: "PostShare",
    foreign_key: :post_id,
    primary_key: :id

  has_many :shared_circles,
    through: :post_shares,
    source: :circle

  validates :user_id, :body, presence: true
end
