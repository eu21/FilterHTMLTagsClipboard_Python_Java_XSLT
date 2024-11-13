with open('input.html', 'r', encoding='utf-8') as file:
    input_html = file.read()

with open('input_1251.html', 'w', encoding='Windows-1251') as output_file:
    output_file.write(input_html)