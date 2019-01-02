class User < ApplicationRecord
    has_secure_password

    has_many :user_paintings
    has_many :paintings, through: :user_paintings

    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP,
    message: "is invalid" }  
    validates :password, presence: true, length: {in: 6..30} 
    validates :first_name, length:{maximum: 20}, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :last_name, length:{maximum: 20}, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

    

end
