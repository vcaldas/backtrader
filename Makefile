PHONY: talib pre-commit


talib:
	@echo "Installing TA-Lib..."
	@wget https://github.com/ta-lib/ta-lib/releases/download/v0.6.4/ta-lib-0.6.4-src.tar.gz
	@tar -xzf ta-lib-0.6.4-src.tar.gz
	@cd ta-lib-0.6.4 && ./configure --prefix=/usr && make && sudo make install
	@export TA_LIBRARY_PATH=/usr/lib
	@export TA_INCLUDE_PATH=/usr/include
	@rm -rf ta-lib-0.6.4 ta-lib-0.6.4-src.tar.gz
	@echo "TA-Lib installed successfully."


pre-commit:
	@echo "Installing pre-commit and running hooks..."
	pip install pre-commit
	pre-commit install
	pre-commit run --all-files