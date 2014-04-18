# Break out of the Bundler jail
# from https://github.com/ConradIrwin/pry-debundle/blob/master/lib/pry-debundle.rb
if Gem.post_reset_hooks.reject!{ |hook| hook.source_location.first =~ %r{/bundler/} }
  Gem::Specification.reset

  if Gem::VERSION.to_i >= 2
    Kernel.send(:remove_const, "RUBYGEMS_ACTIVATION_MONITOR")
    load 'rubygems/core_ext/kernel_require.rb'
  else
    load 'rubygems/custom_require.rb'
  end
end

# Pry::Commands.block_command('enable-pry', 'Enable `binding.pry` feature') do
#   ENV['DISABLE_PRY'] = nil
# end

begin
  require "pry-stack_explorer"
  require "pry-rescue"
rescue LoadError => e
end

begin
  require "pry-highlight"
rescue LoadError => e
end

begin
  require "pry-toys"
rescue LoadError => e
end

begin
  require "pry-nav"
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
rescue LoadError => e
end

begin
  require "pry-theme"
  Pry.config.theme = "railscasts"
rescue LoadError => e
end

begin
  require 'awesome_print'
  # AwesomePrint.pry!
rescue LoadError => err
end

Pry.config.pager = false

load ENV["HOME"] + '/.pryrc_rails' if [ "bin/rails", "script/rails" ].include?($0)
