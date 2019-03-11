class User < ApplicationRecord

  ROLES = %i[admin participant parent mentor college_manager tutor head_office]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  ROLES.each do |role|
    define_method "#{role}?" do 
      self.role == "#{role}"
    end
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
