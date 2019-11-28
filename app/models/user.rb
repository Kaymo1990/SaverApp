class User < ApplicationRecord
    before_save { self.username = username.downcase }
    validates :username, presence: true,
    uniqueness: { case_sensitive: false }
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :salary, presence: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
