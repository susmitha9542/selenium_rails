class Scheduler < ActiveRecord::Base
  has_one :test_suite

  def self.create_new_schedule(suite_id, date)
    schedule = Scheduler.new
    schedule.test_suite_id = suite_id
    schedule.scheduled_date = date
    schedule.status = "READY"
    schedule.save!
  end
end
