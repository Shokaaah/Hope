class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  has_many :comments, dependent: :delete_all
  
  attr_accessor :current_password, :avatar, :image

  mount_uploader :avatar, AvatarUploader
  after_commit :remove_previously_stored_avatar, on: :update
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_attached_file :avatar, :default_url =>     "/images/:style/missing.png"

end
