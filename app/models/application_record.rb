# This class is for managing active records
# class ApplicationRecord 
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
