class SuiteSchedule < ActiveRecord::Base
    has_one :test_suite

    def self.schedule_daily_suites
        
    end
end
  