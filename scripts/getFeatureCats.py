import urllib2
import json

def cleanName(name):
    return name.replace(' ','').replace('(','').replace(')','').replace(',','').replace('-','').replace('&','And')

file = urllib2.urlopen('http://api.simplegeo.com/1.0/features/categories.json')
contents = json.loads(file.read())

types = []
fcats = []
fsubcats = []
pcats = []

for entry in contents:
    thisType = entry['type']
    thisCat = entry['category']
    thisSubcat = entry['subcategory']

    if thisType and thisType != '':
        try:
            types.index(thisType)
        except:
            types.append(thisType)

    cats = pcats
    subcats = pcats
    if thisType == 'Region':
        cats = fcats
        subcats = fsubcats

    if thisCat and thisCat != '':
        try:
            cats.index(thisCat)
        except:
            cats.append(thisCat)

    if thisSubcat and thisSubcat != '':
        try:
            subcats.index(thisSubcat)
        except:
            subcats.append(thisSubcat)

output = '// Feature Types\n'
for typ in types:
    output += '#define SGFeatureType' + cleanName(typ) + ' @\"' + typ + '\"\n'

output += '// Feature Categories (Context)\n'
for cat in fcats:
    output += '#define SGFeatureCategory' + cleanName(cat) + ' @\"' + cat + '\"\n'
for subcat in fsubcats:
    output += '#define SGFeatureSubcategory' + cleanName(subcat) + ' @\"' + subcat + '\"\n'

output += '// Feature Categories (Places)\n'
for cat in pcats:
    output += '#define SGPlacesCategory' + cleanName(cat) + ' @\"' + cat + '\"\n'

outputFile = open('featureCategories.txt','w+')
outputFile.write(output)
outputFile.close()
