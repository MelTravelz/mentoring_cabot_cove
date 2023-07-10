class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.alphabetize
    order(:name)
  end
end
