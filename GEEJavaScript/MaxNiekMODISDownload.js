/*
# Project The Great Green Wall
# Geoscripting
# Wageningen University
# The Geodudes
# Max Hoving and Niek Koelewijn
# Date: 25 Januari 2021 - 29 Januari 2021
# License: Apache License version 2
//*/

// Create a polygon feature of a country specified by the number after "ADM0_CODE".
// The default country is set to Senegal (217). Refer to README for ADM0 codes to change the country.
var border = ee.FeatureCollection('FAO/GAUL/2015/level0');
var borderSEN = border.filter(ee.Filter.equals("ADM0_CODE", 217));

// Create a ImageCollection of the MODIS database
// 2007 is the start of the Great Green Wall project.
// By default the dates are filtered from May 1 to October 1,
// because this is the wet / growing season of Senegal.
var SenegalStart = ee.ImageCollection('MODIS/006/MOD09A1')
                  .filter(ee.Filter.date('2007-05-01', '2007-10-01'))
                  .filterBounds(borderSEN);

// Create a ImageCollection for the same dates in 2020
var SenegalEnd = ee.ImageCollection('MODIS/006/MOD09A1')
                  .filter(ee.Filter.date('2020-05-01', '2020-10-01'))
                  .filterBounds(borderSEN);  

// Calculate the median value for the aquired images
var SenegalStartmedian = SenegalStart.reduce(ee.Reducer.median());
var SenegalEndmedian = SenegalEnd.reduce(ee.Reducer.median());

// Check the created variables in the console
print(borderSEN);
print(SenegalStartmedian);
print(SenegalEndmedian);

// Export the images to Google Drive
Export.image.toDrive({
  image: SenegalStartmedian,
  description: 'SenegalStart',
  scale: 1000,
  region: borderSEN
});

Export.image.toDrive({
  image: SenegalEndmedian,
  description: 'SenegalEnd',
  scale: 1000,
  region: borderSEN
});

// Define the visualization parameters.
var vizParams = {
  bands: ['sur_refl_b01_median', 'sur_refl_b04_median', 'sur_refl_b03_median'],
  min: 0,
  max: 3500,
  gamma: [0.95, 1.1, 1]
};


// RGB composition of the image
Map.addLayer(SenegalStartmedian,
            vizParams,
            "RGB composite");
