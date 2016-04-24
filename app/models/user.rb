class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username


  has_many :comments, dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessor :current_password
end
