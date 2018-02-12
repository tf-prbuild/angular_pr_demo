result = system "./node_modules/.bin/protractor protractor_#{ARGV[0]}.conf.js"
system "docker stop docker_name"

raise StandardError, "Protractor Tests Failed" unless result
