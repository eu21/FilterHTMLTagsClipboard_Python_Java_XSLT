with open('input.html', 'r', encoding='Windows-1252') as file:
    input_html = file.read()

with open('input_cleaned.html', 'w', encoding='utf-8') as output_file:
    output_file.write(input_html)