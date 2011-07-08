import urllib2
import json

file = urllib2.urlopen('http://api.simplegeo.com/1.0/features/categories.json')
contents = json.loads(file.read())

catList = []

for entry in contents:
    if entry['type'] == 'Region':
        thisCat = entry['category']
        thisSubCat = entry['subcategory']
        thisCatString = thisSubCat
        if thisCatString == '':
            thisCatString = thisCat
        thisCat = thisCat.replace(' ','').replace('(','').replace(')','')
        thisSubCat = thisSubCat.replace(' ','').replace('(','').replace(')','')
        catList.append('#define SGFeatureCategory' + thisCat + thisSubCat + ' @\"' + thisCatString + '\"')

outputFile = open('featureCategories.txt','w+')
for cat in catList:
    outputFile.write(cat + '\n')
outputFile.close()
