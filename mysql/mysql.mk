# Install a specific version of MySQL by passing the version to this target. Use
# major and minor versions separated by a dot. For example, install-mysql-5.6.
.PHONY: install-mysql-%
install-mysql-%: ## Install a specific version of MySQL by replacing the %, e.g. install-mysql-5.6.
	$(info Installing MySQL $*...)
#	# Ensure MySQL version is correctly formatted.
	@if [[ ! "$*" =~ ^[0-9]\.[0-9]$$ ]]; then\
	  echo "MySQL version $* is an invalid format.";\
	  exit 1;\
	fi
	add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty universe'
	$(MAKE) -B packages-update
	$(MAKE) install-package-mysql-server-$(*)
	@echo "Installed MySQL $(*)."
