class MentorGroup < ApplicationRecord
  has_many :users, class_name: 'User'
  validates :name, presence: true, uniqueness: true

  def self.to_csv
    attributes = %w{id name}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

end
