.PHONY: install compile decompile setup

SOURCE = $(shell pwd)
SOURCE_EXT = applescript
DESTINATION = ${HOME}/Library/Scripts
DEST_EXT = scpt

install: symlink compile
sync: delete compile

symlink:
	destination="$(DESTINATION)/Applications/Safari Technology Preview"; \
	if [ ! -e "$$destination" ]; then \
	source="$(DESTINATION)/Applications/Safari"; \
	mkdir -p "$$source"; \
	ln -s "$$source" "$$destination"; \
	fi

delete:
	find "$(DESTINATION)" -name "*.scpt" -type f -delete

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

remove_trailing_lines:
	git ls-files "*.applescript" -z |\
		xargs -n 1 -0 sed -i '' -e :a -e '/^\n*$$/{$$d;N;ba' -e '}'
