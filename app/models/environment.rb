class Environment < ActiveRecord::Base
  #has_and_belongs_to_many :test_suites, join_table: :enviro_suite
  has_many :test_suites
end
