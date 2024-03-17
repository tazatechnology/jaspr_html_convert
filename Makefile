.DEFAULT_TARGET: help
.PHONY: help init format

init:
# Install the required dependencies
	@dart pub get
	@cd example && make init

format:
# Execute the code formatters
	@dart format lib
	@dart run import_sorter:main
	@cd example && make format