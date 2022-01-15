#!/bin/zsh

COMPLETED=`grep '^ \+[\[<A-Z]' gnomvat.md | wc -l | tr -d ' ' | tr -d "\n"`
PERCENTAGE_FLOAT="$(( $COMPLETED / 577.0 * 100))"
PERCENTAGE=`printf "%.0f\n" "$PERCENTAGE_FLOAT"`
echo "{\n  \"schemaVersion\": 1,\n  \"label\": \"Translation Progress\",\n  \"message\": \"${COMPLETED} / 577 (${PERCENTAGE}%)\",\n  \"color\": \"yellow\"\n}" > progress.json
