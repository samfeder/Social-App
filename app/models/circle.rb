class Circle < ActiveRecord::Base
  has_many :memberships,
    class_name: "CircleMembership",
    foreign_key: :circle_id,
    primary_key: :id

  belongs_to :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id

  has_many :members,
    through: :memberships,
    source: :member

  validates :owner_id, :name, presence: true

end
