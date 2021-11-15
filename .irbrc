require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000

if defined?(::Rails)
  IRB.conf[:HISTORY_FILE] = File.join(ENV['PWD'], '.irb-history')
else
  IRB.conf[:HISTORY_FILE] = File.join(ENV['HOME'], '.irb-history')
end
