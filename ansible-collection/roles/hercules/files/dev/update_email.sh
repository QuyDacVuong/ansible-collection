#!/bin/bash

# Replace email addresses with global-casinodevops@pokerstarsint.com in dev/laws for hercules QA

for f in `find . -name "*.ini" -print`
do
	sed 's/to=\([^,]*\),/to=global-casinodevops@pokerstarsint.com/g' $f > $f.new
	mv $f.new $f
done
