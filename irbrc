#!/usr/bin/ruby

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE]  = :SIMPLE


# Break out of the Bundler jail
# from https://github.com/ConradIrwin/pry-debundle/blob/master/lib/pry-debundle.rb
if defined? Bundler
  Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
  Gem::Specification.reset
  load 'rubygems/custom_require.rb'
end



# require 'irbtools'




# %w[rubygems looksee/shortcuts wirble].each do |gem|
#   begin
#     require gem
#   rescue LoadError
#   end
# end

# def copy(str)
#   IO.popen('pbcopy', 'w') { |f| f << str.to_s }
# end

# def copy_history
#   history = Readline::HISTORY.entries
#   index = history.rindex("exit") || -1
#   content = history[(index+1)..-2].join("\n")
#   puts content
#   copy content
# end

# def paste
#   `pbpaste`
# end

load File.dirname(__FILE__) + '/.rails_irbrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || $0 == "script/rails"
