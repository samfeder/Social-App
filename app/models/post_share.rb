class PostShare < ActiveRecord::Base
  belongs_to :post, :inverse_of => :post_shares,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id

  belongs_to :circle, :inverse_of => :post_shares,
    class_name: "Circle",
    foreign_key: :circle_id,
    primary_key: :id

  validates :circle_id, :post_id, presence: true
end
