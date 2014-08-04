class Circle < ActiveRecord::Base
  has_many :memberships, :inverse_of => :circle,
    class_name: "CircleMembership",
    foreign_key: :circle_id,
    primary_key: :id

  belongs_to :owner, :inverse_of => :owned_circles,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id

  has_many :members,
    through: :memberships,
    source: :member

  has_many :post_shares, :inverse_of => :circle,
    class_name: "PostShare",
    foreign_key: :circle_id,
    primary_key: :id

  has_many :posts,
    through: :post_shares,
    source: :post

  validates :owner_id, :name, presence: true
  validates :name, uniqueness: { scope: :owner_id}

end
