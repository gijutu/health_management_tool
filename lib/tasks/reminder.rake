task :morning_reminder_task => :environment do
  linebot_controller = LinebotController.new
  linebot_controller.morning_push
end

task :night_reminder_task => :environment do
  linebot_controller = LinebotController.new
  linebot_controller.night_push
end

task :reminder_task => :environment do
  linebot_controller = LinebotController.new
  linebot_controller.push
end
