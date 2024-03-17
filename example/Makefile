.DEFAULT_TARGET: help
.PHONY: help init format

init:
# Install the required dependencies
	@dart pub get

format:
# Execute the code formatters
	@dart format lib
	@dart run import_sorter:main