all: ready

ready:
	@bundle check 2>&1 >/dev/null || { bundle --local --path vendor/bundle > /dev/null && bundle check; }

cook: ready
	@bundle exec chef-local -c etc/chef/solo.rb -j config/demo.json

demo: ready
	@bin/compare
