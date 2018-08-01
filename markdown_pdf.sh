#!/bin/bash
#
# Quick & dirty script to use pandoc to convert markdown to pdf with default
# options.

usage () {
    echo
    echo "Expectations:"
    echo
    echo "* Docker installed; Pandoc + Latex = ~100 Haskell packages. Using:"
    echo "    https://hub.docker.com/r/jagregory/pandoc/ instead."
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
FILENAME="${FULL_FILENAME%.*}"  # strip off extension.
TITLE="${FILENAME//_/ }"  # Swap underscores for spaces.

# pandoc craig_astill_cv.md -o craig_astill_cv.pdf
docker run -v `pwd`:/source jagregory/pandoc \
    -V title-meta:"${TITLE}" \
    "${FULL_FILENAME}" layout.yaml -o "${FILENAME}.pdf"

echo "Generated: ${FILENAME}.pdf"
