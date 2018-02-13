class Lamp < ActiveRecord::Base
  STATUS_ON = 0
  STATUS_OFF = 1
  STATUS_OUT_OF_SERVICE = 2

  STATUS_NAMES = {
    'On' => STATUS_ON,
    'Off' => STATUS_OFF,
    'Out of Service' => STATUS_OUT_OF_SERVICE
  }
  validates_uniqueness_of :name, case_sensitive: false
  validates_uniqueness_of :latitude, scope: :longitude


end
