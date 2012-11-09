class User < ActiveRecord::Base
  #before_save :setup_role

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :rnumber, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates_presence_of :name, :rnumber
  validates_uniqueness_of :name, :email, :rnumber, :case_sensitive => false
end
