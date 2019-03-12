class User < ApplicationRecord

  ROLES = %i[admin participant parent mentor college_manager tutor head_office]
  
  belongs_to :mentor_group, optional: true
  has_many :mentees, class_name: 'User', foreign_key: 'mentor_id'
  belongs_to :mentor, class_name: 'User', optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  scope :roled_users, -> (role) { where(role: role) }

  ROLES.each do |role|
    define_method "#{role}?" do 
      self.role == "#{role}"
    end
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
