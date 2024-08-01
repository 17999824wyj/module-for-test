# tests/test00-TestForThis/function/Makefile
.PHONY: all clean

all: result.json

result.json:
	@echo "[LOG] >> Running function tests..."
	@./exec.sh
	@if [ ! -f $@ ]; then \
		echo "[LOG] >> Error: exec.sh did not produce a result.json file."; \
		exit 1; \
	fi

clean:
	@rm -f result.json
