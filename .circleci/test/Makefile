# Test the Tugboat Makefile

include /usr/share/tugboat/Makefile

.PHONY: test
test:
	######
	# Test install-package-wget (install-package-%)
	! hash wget 2>/dev/null
	$(MAKE) install-package-wget
	hash wget
	apt-get remove wget -y

	######
	# Test install-php-7.2 (install-php-%)
	! hash php 2>/dev/null
	$(MAKE) install-php-7.2
	php -v | grep ^PHP\ 7\.2

	######
	# Test install-composer
	! hash composer 2>/dev/null
	$(MAKE) install-composer
	hash composer

	######
	# Test install-drush-launcher
	! hash drush 2>/dev/null
	$(MAKE) install-drush-launcher
	hash drush
	drush --version | grep '^The Drush launcher'
	rm /usr/bin/drush

	######
	# Test install-drush
	! hash drush 2>/dev/null
	$(MAKE) install-drush
	hash drush

	######
	# Test install-terminus
	! hash terminus 2>/dev/null
	$(MAKE) install-terminus
	hash terminus

	######
	# Test install-nodejs-8 (install-nodejs-%)
	! hash nodejs 2>/dev/null
	$(MAKE) install-nodejs-8
	hash nodejs
	nodejs --version | grep ^v8
