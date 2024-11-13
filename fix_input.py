import re
from bs4 import BeautifulSoup
from lxml import etree

def close_explicitly(match):
    tag = match.group(1)
    attrs = match.group(2)
    return f'<{tag}{attrs}></{tag}>'

# Read input from input.html file
with open("input.html", "r", encoding="utf-8") as input_file:
    input_html = input_file.read()

# Parse input HTML using BeautifulSoup
soup = BeautifulSoup(input_html, "html.parser")
fixed_html = str(soup)

# Close the self-closing tags explicitly with regex substitution
fixed_html = re.sub(r'<(input)([^>]*)/>', close_explicitly, fixed_html)

# Parse fixed HTML using lxml etree
parser = etree.XMLParser(recover=True)
tree = etree.fromstring(fixed_html, parser=parser)

# Read XSLT from input_fixed.xsl or transformation.xsl file
with open("input_fixed.xsl", "r", encoding="utf-8") as xsl_file:
    xslt = xsl_file.read()

# Apply XSLT to fixed HTML
xslt_doc = etree.fromstring(xslt)
transform = etree.XSLT(xslt_doc)

output_tree = transform(tree)

# Serialize output tree using html method to keep it in HTML format
output_html = etree.tostring(output_tree, method='html', pretty_print=True, encoding='unicode')

# Write fixed HTML to output.html file
with open("output.html", "w", encoding="utf-8") as output_file:
    output_file.write(output_html)