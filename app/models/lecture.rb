class Lecture < ApplicationRecord
  belongs_to :program, optional: true
end
