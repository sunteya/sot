# Break out of the Bundler jail
# from https://github.com/ConradIrwin/pry-debundle/blob/master/lib/pry-debundle.rb
if Gem.post_reset_hooks.reject!{ |hook| hook.source_location.first =~ %r{/bundler/} }
  Gem::Specification.reset

  if Gem::VERSION.to_i >= 2
    load 'rubygems/core_ext/kernel_require.rb'
  else
    load 'rubygems/custom_require.rb'
  end
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
  # Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
end

Pry.config.pager = false

load ENV["HOME"] + '/.pryrc_rails' if [ "bin/rails", "script/rails" ].include?($0)
