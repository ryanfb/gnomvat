#!/bin/zsh

COMPLETED=`grep '^ \+[\[<A-Z]' gnomvat.md | wc -l | tr -d ' ' | tr -d "\n"`
# subtract 2 to account for formatting in entry 41
# subtract 5 to account for formatting in entry 320
# subtract 7 to account for formatting in entry 321
# subtract 1 to account for formatting in entry 515
COMPLETED="$(($COMPLETED - (2 + 5 + 7 + 1)))"
PERCENTAGE_FLOAT="$(( $COMPLETED / 577.0 * 100))"
PERCENTAGE=`printf "%.0f\n" "$PERCENTAGE_FLOAT"`
echo "{\n  \"schemaVersion\": 1,\n  \"label\": \"Translation Progress\",\n  \"message\": \"${COMPLETED} / 577 (${PERCENTAGE}%)\",\n  \"color\": \"yellow\"\n}" > progress.json
