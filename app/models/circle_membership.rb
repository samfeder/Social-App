class CircleMembership < ActiveRecord::Base

  belongs_to :member, :inverse_of => :memberships,
    class_name: "User",
    foreign_key: :member_id,
    primary_key: :id

  belongs_to :circle, :inverse_of => :memberships,
    class_name: "Circle",
    foreign_key: :circle_id,
    primary_key: :id

end
