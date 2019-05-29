# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
set :environment, :development
#
every 1.day, at: '8am' do
  rake 'morning_reminder_task'
end

every 1.day, at: '8pm' do
  rake 'night_reminder_task'
end

every 1.minutes do
  rake 'reminder_task'
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
