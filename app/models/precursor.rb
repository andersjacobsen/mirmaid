class Precursor < ActiveRecord::Base
  belongs_to :species
  has_many :matures
  belongs_to :precursor_family
  has_many :genome_positions #since there are some that maps perfectly to more than one postion
  has_many :genome_contexts
  has_and_belongs_to_many :papers
  has_many :precursor_external_synonyms

  def self.find_rest(id)
    if id.to_s.chomp =~ /\D/
      self.find_by_name(id)
    else
      self.find(id.to_i)
    end
  end
  
end
