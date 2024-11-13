import chardet

# Detect the input file's encoding
with open('input.html', 'rb') as input_file:
    data = input_file.read()

detected_encoding = chardet.detect(data)['encoding']

# Read the input file using the detected encoding
with open('input.html', 'r', encoding=detected_encoding) as input_file:
    input_html = input_file.read()

# Write cleaned input to a new file in UTF-8
with open('input_cleaned.html', 'w', encoding='utf-8') as output_file:
    output_file.write(input_html)