class CaseSuite < ActiveRecord::Base
  belongs_to :test_cases
  belongs_to :test_suites
end
