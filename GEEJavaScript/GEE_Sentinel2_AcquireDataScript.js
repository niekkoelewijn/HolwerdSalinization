/*
# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0
//*/

// Define the bands for RBG plotting on map
var rgbVis = {
  min: 0.0,
  max: 3000,
  bands: ['B4', 'B3', 'B2'],
};

var falsecolourVis = {
  min: 0.0,
  max: 3000,
  bands: ['B8', 'B4', 'B3'],
};


//Usefull bands: ['B8','B5','B4', 'B3', 'B2']

/// Download of the images ///

////////////////////////////////////////////////////////////////////////////////////////////
// Image 01 January
var myCollection01 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-01-01','2019-1-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList01 = myCollection01.toList(myCollection01.size())
print(CollectionList01)
var myImage01 = ee.Image(CollectionList01.get(0))
print(myImage01)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage01.clip(StudyArea), rgbVis, 'RGB1')
Map.addLayer(myImage01.clip(StudyArea), falsecolourVis, 'FCC1')
Export.image.toDrive(myImage01,'myImage01','HolwerdImages','January2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 02 February
var myCollection02 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-02-01','2019-02-28')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList02 = myCollection02.toList(myCollection02.size())
print(CollectionList02)
var myImage02 = ee.Image(CollectionList02.get(0))
print(myImage02)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage02.clip(StudyArea), rgbVis, 'RGB2')
Map.addLayer(myImage02.clip(StudyArea), falsecolourVis, 'FCC2')
Export.image.toDrive(myImage02,'myImage02','HolwerdImages','February2019',null,StudyArea)
//*/
////////////////////////////////////////////////////////////////////////////////////////////
// Image 03 March
var myCollection03 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-03-01','2019-03-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList03 = myCollection03.toList(myCollection03.size())
print(CollectionList03)
var myImage03 = ee.Image(CollectionList03.get(2))
print(myImage03)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage03.clip(StudyArea), rgbVis, 'RGB3')
Map.addLayer(myImage03.clip(StudyArea), falsecolourVis, 'FCC3')
Export.image.toDrive(myImage03,'myImage03','HolwerdImages','March2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 04 April
var myCollection04 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-04-01','2019-04-30')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList04 = myCollection04.toList(myCollection04.size())
print(CollectionList04)
var myImage04 = ee.Image(CollectionList04.get(0))
print(myImage04)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage04.clip(StudyArea), rgbVis, 'RGB4')
Map.addLayer(myImage04.clip(StudyArea), falsecolourVis, 'FCC4')
Export.image.toDrive(myImage04,'myImage04','HolwerdImages','April2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 05 May
var myCollection05 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-05-01','2019-05-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList05 = myCollection05.toList(myCollection05.size())
print(CollectionList05)
var myImage05 = ee.Image(CollectionList05.get(0))
print(myImage05)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage05.clip(StudyArea), rgbVis, 'RGB5')
Map.addLayer(myImage05.clip(StudyArea), falsecolourVis, 'FCC5')
Export.image.toDrive(myImage05,'myImage05','HolwerdImages','May2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 06 June
var myCollection06 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-06-01','2019-06-30')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList06 = myCollection06.toList(myCollection06.size())
print(CollectionList06)
var myImage06 = ee.Image(CollectionList06.get(0))
print(myImage06)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage06.clip(StudyArea), rgbVis, 'RGB6')
Map.addLayer(myImage06.clip(StudyArea), falsecolourVis, 'FCC6')
Export.image.toDrive(myImage06,'myImage06','HolwerdImages','June2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 07 July
var myCollection07 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-07-01','2019-07-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList07 = myCollection07.toList(myCollection07.size())
print(CollectionList07)
var myImage07 = ee.Image(CollectionList07.get(0))
print(myImage07)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage07.clip(StudyArea), rgbVis, 'RGB7')
Map.addLayer(myImage07.clip(StudyArea), falsecolourVis, 'FCC7')
Export.image.toDrive(myImage07,'myImage07','HolwerdImages','July2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 08 August
var myCollection08 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-08-01','2019-08-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList08 = myCollection08.toList(myCollection08.size())
print(CollectionList08)
var myImage08 = ee.Image(CollectionList08.get(0))
print(myImage08)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage08.clip(StudyArea), rgbVis, 'RGB8')
Map.addLayer(myImage08.clip(StudyArea), falsecolourVis, 'FCC8')
Export.image.toDrive(myImage08,'myImage08','HolwerdImages','August2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 09 September
var myCollection09 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-09-01','2019-09-30')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList09 = myCollection09.toList(myCollection09.size())
print(CollectionList09)
var myImage09 = ee.Image(CollectionList09.get(0))
print(myImage09)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage09.clip(StudyArea), rgbVis, 'RGB9')
Map.addLayer(myImage09.clip(StudyArea), falsecolourVis, 'FCC9')
Export.image.toDrive(myImage09,'myImage09','HolwerdImages','September2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 10 October
var myCollection10 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-10-01','2019-10-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList10 = myCollection10.toList(myCollection10.size())
print(CollectionList10)
var myImage10 = ee.Image(CollectionList10.get(0))
print(myImage10)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage10.clip(StudyArea), rgbVis, 'RGB10')
Map.addLayer(myImage10.clip(StudyArea), falsecolourVis, 'FCC10')
Export.image.toDrive(myImage10,'myImage10','HolwerdImages','October2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 11 November
var myCollection11 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-11-01','2019-11-30')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList11 = myCollection11.toList(myCollection11.size())
print(CollectionList11)
var myImage11 = ee.Image(CollectionList11.get(0))
print(myImage11)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage11.clip(StudyArea), rgbVis, 'RGB11')
Map.addLayer(myImage11.clip(StudyArea), falsecolourVis, 'FCC11')
Export.image.toDrive(myImage11,'myImage11','HolwerdImages','November2019',null,StudyArea)

////////////////////////////////////////////////////////////////////////////////////////////
// Image 12 December
var myCollection12 = ee.ImageCollection("COPERNICUS/S2_SR")
                      .filterBounds(StudyArea)
                      .filterDate('2019-12-01','2019-12-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B5','B8'])
                      

// Transform myCollection into a list so we can select the the image we want.
var CollectionList12 = myCollection12.toList(myCollection12.size())
print(CollectionList12)
var myImage12 = ee.Image(CollectionList12.get(0))
print(myImage12)

// Show chosen image on the map and export to google drive
Map.addLayer(myImage12.clip(StudyArea), rgbVis, 'RGB12')
Map.addLayer(myImage12.clip(StudyArea), falsecolourVis, 'FCC12')
Export.image.toDrive(myImage12,'myImage12','HolwerdImages','December2019',null,StudyArea)