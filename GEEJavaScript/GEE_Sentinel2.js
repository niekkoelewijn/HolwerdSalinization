
// Define the bands for RBG plotting
var rgbVis = {
  min: 0.0,
  max: 3000,
  bands: ['B4', 'B3', 'B2'],
};

//////////////////////////////////////////////////////////////////////////////////
// Image 01
var myCollection01 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2015-01-01','2015-12-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList01 = myCollection01.toList(myCollection01.size())
print(CollectionList01)
var myImage01 = ee.Image(CollectionList01.get(1))

//Map.addLayer(myImage01.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage01,'myImage01','geoscripting','myImage20151116',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 02
var myCollection02 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2016-12-01','2017-01-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList02 = myCollection02.toList(myCollection02.size())
print(CollectionList02)
var myImage02 = ee.Image(CollectionList02.get(1)) 

//Map.addLayer(myImage02.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage02,'myImage02','geoscripting','myImage20161230',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 03
var myCollection03 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2017-01-01','2017-04-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList03 = myCollection03.toList(myCollection03.size())
print(CollectionList03)
var myImage03 = ee.Image(CollectionList03.get(4)) 

//Map.addLayer(myImage03.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage03,'myImage03','geoscripting','myImage20170208',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 04
var myCollection04 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2017-10-01','2017-11-15')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList04 = myCollection04.toList(myCollection04.size())
print(CollectionList04)
var myImage04 = ee.Image(CollectionList04.get(4)) 

//Map.addLayer(myImage04.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage04,'myImage04','geoscripting','myImage20171110',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 05
var myCollection05 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2017-11-15','2017-12-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList05 = myCollection05.toList(myCollection05.size())
print(CollectionList05)
var myImage05 = ee.Image(CollectionList05.get(4)) 

//Map.addLayer(myImage05.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage05,'myImage05','geoscripting','myImage20171130',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 06
var myCollection06 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2017-11-15','2017-12-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList06 = myCollection06.toList(myCollection06.size())
print(CollectionList06)
var myImage06 = ee.Image(CollectionList06.get(10)) 

//Map.addLayer(myImage06.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage06,'myImage06','geoscripting','myImage20171230',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 07
var myCollection07 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2018-01-01','2018-02-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList07 = myCollection07.toList(myCollection07.size())
print(CollectionList07)
var myImage07 = ee.Image(CollectionList07.get(9)) 

//Map.addLayer(myImage07.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage07,'myImage07','geoscripting','myImage20180129',null,AreaInterest)


//////////////////////////////////////////////////////////////////////////////////
// Image 08
var myCollection08 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2018-02-01','2018-03-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList08 = myCollection08.toList(myCollection08.size())
print(CollectionList08)
var myImage08 = ee.Image(CollectionList08.get(5)) 

//Map.addLayer(myImage08.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage08,'myImage08','geoscripting','myImage20180228',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 09
var myCollection09 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2018-03-01','2018-04-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList09 = myCollection09.toList(myCollection09.size())
print(CollectionList09)
var myImage09 = ee.Image(CollectionList09.get(7)) 

//Map.addLayer(myImage09.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage09,'myImage09','geoscripting','myImage20180320',null,AreaInterest)


//////////////////////////////////////////////////////////////////////////////////
// Image 10
var myCollection10 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2018-06-01','2018-10-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',50))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList10 = myCollection10.toList(myCollection10.size())
print(CollectionList10)
var myImage10 = ee.Image(CollectionList10.get(6)) 

//Map.addLayer(myImage10.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage10,'myImage10','geoscripting','myImage20180628',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 11
var myCollection11 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2018-07-01','2018-10-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',40))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList11 = myCollection11.toList(myCollection11.size())
print(CollectionList11)
var myImage11 = ee.Image(CollectionList11.get(5)) 

//Map.addLayer(myImage11.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage11,'myImage11','geoscripting','myImage20180916',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 12
var myCollection12 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2018-10-01','2018-12-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList12 = myCollection12.toList(myCollection12.size())
print(CollectionList12)
var myImage12 = ee.Image(CollectionList12.get(14)) 

//Map.addLayer(myImage12.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage12,'myImage12','geoscripting','myImage20181210',null,AreaInterest)


//////////////////////////////////////////////////////////////////////////////////
// Image 13
var myCollection13 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2019-10-01','2019-12-31')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList13 = myCollection13.toList(myCollection13.size())
print(CollectionList13)
var myImage13 = ee.Image(CollectionList13.get(8)) 

//Map.addLayer(myImage13.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage13,'myImage13','geoscripting','myImage20191115',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 14
var myCollection14 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2020-01-01','2020-04-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList14 = myCollection14.toList(myCollection14.size())
print(CollectionList14)
var myImage14 = ee.Image(CollectionList14.get(6)) 

//Map.addLayer(myImage14.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage14,'myImage14','geoscripting','myImage20200203',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 15
var myCollection15 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2020-04-01','2020-07-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList15 = myCollection15.toList(myCollection15.size())
print(CollectionList15)
var myImage15 = ee.Image(CollectionList15.get(7)) 

//Map.addLayer(myImage15.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage15,'myImage15','geoscripting','myImage20200508',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 16
var myCollection16 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2020-10-01','2020-11-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',50))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList16 = myCollection16.toList(myCollection16.size())
print(CollectionList16)
var myImage16 = ee.Image(CollectionList16.get(6)) 

//Map.addLayer(myImage16.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage16,'myImage16','geoscripting','myImage20201020',null,AreaInterest)

//////////////////////////////////////////////////////////////////////////////////
// Image 17
var myCollection17 = ee.ImageCollection("COPERNICUS/S2")
                      .filterBounds(AreaInterest)
                      .filterDate('2020-11-01','2021-02-01')
                      .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE',5))
                      .select(['B2','B3','B4','B8'])

// Transform myCollection into a list so we can select the the image we want.
var CollectionList17 = myCollection17.toList(myCollection17.size())
print(CollectionList17)
var myImage17 = ee.Image(CollectionList17.get(23)) 

//Map.addLayer(myImage17.clip(AreaInterest), rgbVis, 'RGB')
Export.image.toDrive(myImage17,'myImage17','geoscripting','myImage20210118',null,AreaInterest)

// END ////////////////////////////////////////////////////////////////////////////
 