class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Associations
  has_and_belongs_to_many :roles

  # Logic
  def has_role?(role)
    roles.include?(Role.find_by_name(role)) 
  end
  alias_method :have_role?, :has_role?

end
