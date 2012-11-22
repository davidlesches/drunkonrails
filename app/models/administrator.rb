class Administrator < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :posts

  attr_accessible :email, :first_name, :last_name, :password_digest, :twitter

  validates :email, uniqueness: true
  validates :email, :first_name, :last_name, :password, :password_confirmation, presence: true


  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end

end
