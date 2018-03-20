#!/bin/bash
#
# Quick & dirty script to use pandoc to convert markdown to pdf with default
# options.

usage () {
    echo
    echo "Expectations:"
    echo
    echo "* <file.md> - Markdown file to convert to pdf."
    echo
    echo "Usage:"
    echo
    echo "    ./markdown_pdf.sh <file.md>"
    exit 1
}

if [ "$#" -ne 1 ]
then
    echo "ERROR: Missing markdown file."
    usage
fi

FILEPATH=$1
FULL_FILENAME=$(basename "$FILEPATH")
EXTENSION="${FULL_FILENAME##*.}"
FILENAME="${FULL_FILENAME%.*}"

# pandoc craig_astill_cv.md -o craig_astill_cv.pdf
pandoc "${FULL_FILENAME}" -o "${FILENAME}.pdf"

# --pdf-engine-opt=
