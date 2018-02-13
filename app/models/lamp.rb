class Lamp < ActiveRecord::Base
  STATUS_ON = 0
  STATUS_OFF = 1
  STATUS_OUT_OF_SERVICE = 2

  validates_uniqueness_of :name, case_sensitive: false
  validates_uniqueness_of :latitude, scope: :longitude


end
