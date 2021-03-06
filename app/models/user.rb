class User < ActiveRecord::Base
	has_many :complications, dependent: :destroy
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
uniqueness: { case_sensitive: false }
has_secure_password
validates :password, length: { minimum: 6 }
# validates_confirmation_of :password,
# if: lambda { |m| m.password.present? }

def User.new_remember_token
SecureRandom.urlsafe_base64
end

def User.hash(token)
# def User.encrypt(token)
Digest::SHA1.hexdigest(token.to_s)
end


# def feed may be a load of rubbish
  def feed
   self.complications
  end

private

def create_remember_token
# self.remember_token = User.encrypt(User.new_remember_token)
self.remember_token = User.hash(User.new_remember_token)
end

end
