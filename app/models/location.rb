class Location < ActiveRecord::Base
  has_many :organizations
  belongs_to :county
end
