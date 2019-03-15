require 'csv'

class Csv::UserExportService
  attr_accessor :relation

  def initialize(relation)
    @relation = relation
  end

  def generate
    attributes = %w(id name email contact role)
    Csv.generate(headers: true) do |csv|
      csv << attributes
      @relation.each_with_index do |record, index|
        csv << attribute.map{ |attr| record.send(attr) }
      end
    end
  end

end
