import chardet

with open('input_cleaned.html', 'rb') as input_file:
    data = input_file.read()

detected_encoding = chardet.detect(data)
print("Detected encoding:", detected_encoding)