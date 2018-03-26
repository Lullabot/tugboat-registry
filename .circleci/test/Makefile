# Test the Tugboat Makefile

include /usr/share/tugboat/Makefile

.PHONY: test
test:
	######
	# Test _help and _targets
	$(MAKE) _help | grep /usr/share/tugboat/Makefile > /dev/null
	$(MAKE) _targets | grep install-package-% > /dev/null
	@printf "Test passed.\n\n"

	######
	# Test install-package-wget (install-package-%)
	! hash wget 2>/dev/null
	$(MAKE) install-package-wget
	hash wget
	apt-get remove wget -y
	@printf "Test passed.\n\n"

	######
	# Test install-php-7.2 (install-php-%)
	! hash php 2>/dev/null
	$(MAKE) install-php-7.2
	php -v | grep ^PHP\ 7\.2
	@printf "Test passed.\n\n"

	######
	# Test install-composer
	! hash composer 2>/dev/null
	$(MAKE) install-composer
	hash composer
	@printf "Test passed.\n\n"

	######
	# Test install-drush-launcher
	! hash drush 2>/dev/null
	$(MAKE) install-drush-launcher
	hash drush
	drush --version | grep '^The Drush launcher'
	rm /usr/bin/drush
	@printf "Test passed.\n\n"

	######
	# Test install-drush
	! hash drush 2>/dev/null
	$(MAKE) install-drush
	hash drush
	@printf "Test passed.\n\n"

	######
	# Test install-terminus
	! hash terminus 2>/dev/null
	$(MAKE) install-terminus
	hash terminus
	@printf "Test passed.\n\n"

	######
	# Test install-nodejs-8 (install-nodejs-%)
	! hash nodejs 2>/dev/null
	$(MAKE) install-nodejs-8
	hash nodejs
	nodejs --version | grep ^v8
	@printf "Test passed.\n\n"

	@echo "All Makefile tests passed."
