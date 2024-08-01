.PHONY: all clean $(SUBDIRS) $(SUBDIRS-clean)

SUBDIRS := performance function
SUBDIRS-clean := $(foreach dir,$(SUBDIRS),$(dir)/clean)
RESULT_FILE := result.json
CURRENT_DIR := $(notdir $(CURDIR))

all: $(SUBDIRS)
	@echo "{\n\"name\": \"$(CURRENT_DIR)\",\n\"res\": [" >$(RESULT_FILE)
	@first=1; for dir in $(SUBDIRS); do \
		if [ $$first -eq 1 ]; then \
			first=0; \
		else \
			echo "," >> $(RESULT_FILE); \
		fi; \
		if [ ! -f $$dir/result.json ]; then \
			make -C $$dir; \
		fi; \
		if [ -f $$dir/result.json ]; then \
			cat $$dir/result.json >>$(RESULT_FILE); \
		else \
			echo "No result.json found in $$dir after make."; \
		fi; \
	done
	@echo "]\n}" >> $(RESULT_FILE)

$(SUBDIRS):
	@make -C $@

$(SUBDIRS-clean):
	@echo "[LOG] >> Cleaning $(@D)..."
	@make clean -C $(@D)
	@echo "[LOG] >> Finished cleaning $(@D)."

clean: $(SUBDIRS-clean)
	@rm -f $(RESULT_FILE)
