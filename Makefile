# Package Info
PACKAGE_NAME=factorial
VERSION=1.0
ARCH=$(shell dpkg --print-architecture)
MAINTAINER="Fisrt Capybara Team"
DESCRIPTION="Factorial calculator"

# Directories
BUILD_DIR=build
DEB_DIR=$(BUILD_DIR)/$(PACKAGE_NAME)_$(VERSION)-1_$(ARCH)
BIN_DIR=$(DEB_DIR)/usr/bin
DEBIAN_DIR=$(DEB_DIR)/DEBIAN

# Flags
CC=g++
CFLAGS=-Wall -Wextra
SRC=first.cpp
OUT=first
TEST_SCRIPTS=$(wildcart tests/*.sh)

# Default target: build executable
all: $(OUT)

# Compile factorial.cpp
$(OUT): $(SRC)
	$(CC) $(CFLAGS) -o $(OUT) $(SRC)

test: $(OUT)
	@for script in $(TEST_SCRIPTS); do \
		echo "Running $$script..."; \
		bash $$script || exit 1; \
	done
	echo "All tests passed!"

# Build .deb package (only if tests pass)
deb: clean all test
	mkdir -p $(BIN_DIR) $(DEBIAN_DIR)
	cp $(OUT) $(BIN_DIR)/
	chmod 755 $(BIN_DIR)/$(OUT)

	# Create control file
	echo "Package: $(PACKAGE_NAME)" > $(DEBIAN_DIR)/control
	echo "Version: $(VERSION)-1" >> $(DEBIAN_DIR)/control
	echo "Depends: libc6, libstdc++6" >> $(DEBIAN_DIR)/control
	echo "Architecture: $(ARCH)" >> $(DEBIAN_DIR)/control
	echo "Maintainer: $(MAINTAINER)" >> $(DEBIAN_DIR)/control
	echo "Description: $(DESCRIPTION)" >> $(DEBIAN_DIR)/control

	# Build the .deb package
	dpkg-deb --build $(DEB_DIR)
	mv $(BUILD_DIR)/$(PACKAGE_NAME)_$(VERSION)-1_$(ARCH).deb .

# Install .deb package
deb_install: deb
	dpkg -i $(PACKAGE_NAME)_$(VERSION)-1_$(ARCH).deb
	echo "Installed"

# Clean build files
clean:
	rm -rf $(OUT) $(TEST_OUT) $(BUILD_DIR) *.deb
	echo "Clean finished"
