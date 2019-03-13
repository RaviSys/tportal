require 'rails_helper'

RSpec.describe Program, type: :model do
  
  program = described_class.new

  describe "Validations" do 

    it "should not be valid without all required attributes" do 
      program.name = nil
      program.description = nil
      expect(program).to_not be_valid
    end

    it "should be valid with all required attributes" do 
      program.name = "Some Program"
      program.description = "Pending....."
      expect(program).to be_valid
    end

  end

  describe "Associations" do 

    it "has many tutor programs" do 
      assc = described_class.reflect_on_association(:tutor_programs)
      expect(assc.macro).to eq :has_many
    end

    it "has many participant programs" do 
      assc = described_class.reflect_on_association(:participant_programs)
      expect(assc.macro).to eq :has_many
    end

    it "has many participants through programs" do 
      assc = described_class.reflect_on_association(:participants)
      expect(assc.macro).to eq (:has_many)
    end

    it "has many tutors through programs" do 
      assc = described_class.reflect_on_association(:tutors)
      expect(assc.macro).to eq (:has_many)
    end

  end 

end
