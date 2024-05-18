#!/bin/bash
# Convert Quarto slides to PDF

# Input and output file names
INPUT_QMD="Slides.qmd"
HTML_FILE="Slides.html"
OUTPUT_PDF="Slides.pdf"

# Convert Quarto to HTML
quarto render "$INPUT_QMD" -o "$HTML_FILE"

# Generate PDF using Decktape
decktape reveal "$HTML_FILE" "$OUTPUT_PDF"

echo "PDF generated: $OUTPUT_PDF"