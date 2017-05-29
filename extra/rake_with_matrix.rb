#!/usr/bin/env ruby

LINE_SIZE = 80
envs = [
  'MATHN=true RUBOCOP=true',
  'MATHN=false RUBOCOP=false',
]

is_ok = true
envs.each do |env|
  puts '#' * LINE_SIZE
  puts "Testing with env: #{env} ..."
  cmd = <<-EOF
    export #{env} && \
    bundle exec rake
EOF
  puts "Command: #{cmd}"
  is_ok = false unless system(cmd)
end

abort 'Failed' unless is_ok
