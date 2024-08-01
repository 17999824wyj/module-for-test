.PHONY: all clean res.json $(TEST_DIRS) $(TEST_DIRS-clean) $(TEST_DIRS-res)

TEST_DIRS = $(shell find . -maxdepth 1 -type d -name 'test*')
TEST_DIRS-clean = $(foreach dir,$(TEST_DIRS),$(dir)/clean)
TEST_DIRS-res = $(foreach dir,$(TEST_DIRS),$(dir)/result.json)

all: $(TEST_DIRS) res.json

res.json: $(TEST_DIRS-res)
	@echo '{ "results": [' > $@
	@echo "[LOG] >> Collecting results..."
	@first=1; for result in $(TEST_DIRS-res); do \
		if [ $$first -eq 1 ]; then \
			first=0; \
		else \
			echo "," >> $@; \
		fi; \
		if [ -f $$result ]; then \
			cat $$result >> $@; \
		else \
			echo "[LOG] >> No result.json found in $$result."; \
		fi; \
	done
	@echo ']\n}' >> $@


$(TEST_DIRS): $(TEST_DIRS)/result.json

$(TEST_DIRS)/result.json:
	@echo "[LOG] >> Building $@..."
	@make -C $(@D)
	@echo "[LOG] >> Finished building $(@D)."

$(TEST_DIRS-clean):
	@echo "[LOG] >> Cleaning $(@D)..."
	@make clean -C $(@D)
	@echo "[LOG] >> Finished cleaning $(@D)."

clean: $(TEST_DIRS-clean)
	@rm -f res.json
