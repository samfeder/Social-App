class Link < ActiveRecord::Base
  belongs_to :post, :inverse_of => :links,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id

  validates :address, :post_id, presence: true
end
