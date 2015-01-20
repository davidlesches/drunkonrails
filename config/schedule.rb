env :PATH, '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'

set :output, "#{path}/log.cron.log"

every 1.day, at: '1:00 am' do
  command "backup perform --trigger blog"
end
