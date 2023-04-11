run: compile
	@echo "Running tests for \"$(A)\" exercise..."
	@cabal run agda2hsUserStudy -- $(A)

build: compile
	@echo "Building the Haskell project..."
	@cabal build
	@echo ""

compile: clean
	@echo "Generating Haskell library with Agda2HS..."
	@chmod +x compile-agda.sh
	@./compile-agda.sh
	@echo ""

clean:
	@echo "Cleaning the generated files..."
	@rm -r src
	@mkdir src
	@echo ""

install :
	cabal new-install --overwrite-policy=always
