class Administrator < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :posts

  attr_accessible :email, :first_name, :last_name, :password_digest, :twitter, :password, :password_confirmation

  validates :email, uniqueness: true
  validates :email, :first_name, :last_name, presence: true
  validates :password, :password_confirmation, presence: true, if: :new_record?


  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end

end
