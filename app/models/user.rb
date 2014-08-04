class User < ActiveRecord::Base
  has_many :owned_circles, :inverse_of => :owner,
    class_name: "Circle",
    foreign_key: :owner_id,
    primary_key: :id

  has_many :memberships, :inverse_of => :member,
    class_name: "CircleMembership",
    foreign_key: :member_id,
    primary_key: :id

  has_many :belonged_circles, through: :memberships, source: :circle

  after_initialize :ensure_session_token

  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true

  attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    user = self.find_by_email(email)
    (user && user.is_password?(password)) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
