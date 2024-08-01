.PHONY: all clean res.json $(TEST_DIRS)$(TEST_DIRS-clean) $(TEST_DIRS-res)

TEST_DIRS := $(shell find . -maxdepth 1 -type d -name 'test*')
TEST_DIRS-clean := $(addsuffix /clean,$(TEST_DIRS))
TEST_DIRS-res := $(addsuffix /result.json,$(TEST_DIRS))

all: $(TEST_DIRS-res) res.json

res.json: $(TEST_DIRS-res)
	@echo '{ "results": [' > $@
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

$(TEST_DIRS-res):
	@echo "[LOG] >> Building $@..."
	@make all -C $(dir $@)
	@echo "[LOG] >> Finished building $(dir $@)."

$(TEST_DIRS-clean):
	@echo "[LOG] >> Cleaning $(dir $@)..."
	@make clean -C $(dir $@)
	@echo "[LOG] >> Finished cleaning $(dir $@)."

clean: $(TEST_DIRS-clean)
	@echo "[LOG] >> Cleaning $(CURDIR)..."
	@rm -f res.json
