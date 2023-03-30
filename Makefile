run: build
	@cabal run

build: compile
	@echo "Building the Haskell project..."
	@cabal build
	@echo ""

compile: clean
	@echo "Generating Haskell library with Agda2HS..."
	@agda2hs lib/Lib.agda -o src
	@rm src/Lib.hs
	@echo ""

clean:
	@echo "Cleaning the generated files..."
	@rm -r src
	@mkdir src
	@echo ""

install :
	cabal new-install --overwrite-policy=always
