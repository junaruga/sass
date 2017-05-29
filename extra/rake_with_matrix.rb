#!/usr/bin/env ruby

LINE_SIZE = 80
cmds = [
  'export MATHN=true RUBOCOP=true && bundle exec rake',
  'export MATHN=false && bundle exec rake test:ruby',
]

is_ok = true
cmds.each do |cmd|
  puts '#' * LINE_SIZE
  puts "Testing with command: #{cmd} ..."
  is_ok = false unless system(cmd)
end

abort 'Failed' unless is_ok
