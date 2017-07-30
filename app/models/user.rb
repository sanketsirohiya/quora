class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable

  enum role: {reader:0 , member: 1, moderator: 2, admin: 3}      

 
end
