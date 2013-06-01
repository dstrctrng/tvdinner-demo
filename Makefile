all: ready

ready:
	@bundle check 2>&1 >/dev/null || { bundle --local --path vendor/bundle > /dev/null && bundle check; }

cook: ready
	@bundle exec chef-local -c etc/chef/solo.rb -o tvdinner

compare: cook
	@libexec/compare config/noop.json
