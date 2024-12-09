.PHONY: install compile compile_modified decompile setup

SOURCE = $(shell pwd)
SOURCE_EXT = applescript
DESTINATION = ${HOME}/Library/Scripts
DEST_EXT = scpt

sync: delete compile

delete:
	@find "$(DESTINATION)" -name "*.scpt" -type f -delete

compile_modified:
	@git ls-files --modified --others -z '**/*.applescript' |\
		while IFS= read -r -d '' file; do \
		file_no_ext="$${file%.*}"; \
		name="$${file_no_ext##*/}"; \
		directory="$(DESTINATION)/$${file%/*}"; \
		destination="$$directory/$$name.$(DEST_EXT)"; \
		mkdir -p "$$directory" && \
		osacompile -o "$$destination" "$$file"; \
		done

compile:
	@find . -type f -name '*.$(SOURCE_EXT)' -print0 |\
		while IFS= read -r -d '' file; do \
		file_no_ext="$${file%.*}"; \
		name="$${file_no_ext##*/}"; \
		directory="$(DESTINATION)/$${file%/*}"; \
		destination="$$directory/$$name.$(DEST_EXT)"; \
		mkdir -p "$$directory" && \
		osacompile -o "$$destination" "$$file"; \
		done

decompile:
	@cd $(DESTINATION) && \
		find . -type f -name '*.$(DEST_EXT)' -print0 |\
		while IFS= read -r -d '' file; do \
		file_no_ext="$${file%.*}"; \
		name="$${file_no_ext##*/}"; \
		directory="$(SOURCE)/$${file%/*}"; \
		destination="$$directory/$$name.$(SOURCE_EXT)"; \
		mkdir -p "$$directory" && \
		osadecompile "$$file" > "$$destination"; \
		sed -i '' -e :a -e '/^\n*$$/{$$d;N;ba' -e '}' "$$destination"; \
		done
