# tests/test00-TestForThis/performance/Makefile
.PHONY: all clean

all: result.json

result.json:
	@echo "Running function tests..."
	@./exec.sh
	@if [ ! -f $@ ]; then \
		echo "Error: exec.sh did not produce a result.json file."; \
		exit 1; \
	fi

clean:
	@rm -f result.json
	@rm -f exec.sh.txt
