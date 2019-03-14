class User < ApplicationRecord

  ROLES = %i[admin participant parent mentor college_manager tutor head_office]
  
  belongs_to :mentor_group, optional: true
  has_many :mentees, class_name: 'User', foreign_key: 'mentor_id'
  belongs_to :mentor, class_name: 'User', optional: true
  has_many :tutor_programs, foreign_key: 'tutor_id'
  has_many :participant_programs, foreign_key: 'participant_id'

  validates :first_name, :last_name, :contact, presence: true
  
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

  def programs_enrolled
    if self.participant?
      self.participant_programs.map {|p| p.program}.flatten
    end
  end

  def programs_assigned
    if self.tutor?
      self.tutor_programs.map {|t| t.program}.flatten
    end
  end

end
