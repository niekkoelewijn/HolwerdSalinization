# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

source("./R/download_data.R")

# List the url's to the sentinel images in dropbox
url <- list('https://www.dropbox.com/s/hp78y0kl6i3lock/s2_march_19_2019.tif?dl=1',
            'https://www.dropbox.com/s/vf881oggtojz5o6/s2_march_29_2019.tif?dl=1',
            'https://www.dropbox.com/s/o3wtej87th7x2ij/s2_april_16_2019.tif?dl=1',
            'https://www.dropbox.com/s/a2julndougswuon/s2_april_23_2019.tif?dl=1',
            'https://www.dropbox.com/s/9ljq8x2x104tj43/s2_may_13_2019.tif?dl=1',
            'https://www.dropbox.com/s/v1ziy8ibpeope23/s2_may_16_2019.tif?dl=1',
            'https://www.dropbox.com/s/wbz9vqpqjyn0qn1/s2_june_22_2019.tif?dl=1',
            'https://www.dropbox.com/s/twnk50qkyy79ejy/s2_july_17_2019.tif?dl=1',
            'https://www.dropbox.com/s/dr79us07nc9ro6n/s2_july_27_2019.tif?dl=1',
            'https://www.dropbox.com/s/eef12uhime923t6/s2_august_24_2019.tif?dl=1',
            'https://www.dropbox.com/s/5uvsqvudj499pxb/s2_august_26_2019.tif?dl=1',
            'https://www.dropbox.com/s/14ymy32i8u4pzzz/s2_september_10_2019.tif?dl=1',
            'https://www.dropbox.com/s/rqhpxmv68j91hkp/s2_september_13_2019.tif?dl=1',
            'https://www.dropbox.com/s/w0u66n6l0ezqgu8/s2_october_10_2019.tif?dl=1',
            'https://www.dropbox.com/s/ifugg7t4k4cio33/s2_october_30_2019.tif?dl=1',
            'https://www.dropbox.com/s/40s3t922qsmuvid/s2_december_12_2019.tif?dl=1')
            

#Download the data from dropbox and return them as a RasterBrick
s2_images <- list(download_data(url[1], 's2_03_19_2019'),
                  download_data(url[2], 's2_03_29_2019'),
                  download_data(url[3], 's2_04_16_2019'),
                  download_data(url[4], 's2_04_23_2019'),
                  download_data(url[5], 's2_05_13_2019'),
                  download_data(url[6], 's2_05_16_2019'),
                  download_data(url[7], 's2_06_22_2019'),
                  download_data(url[8], 's2_07_17_2019'),
                  download_data(url[9], 's2_07_27_2019'),
                  download_data(url[11], 's2_08_24_2019'),
                  download_data(url[10], 's2_08_26_2019'),
                  download_data(url[12], 's2_09_10_2019'),
                  download_data(url[13], 's2_09_13_2019'),
                  download_data(url[14], 's2_10_10_2019'),
                  download_data(url[15], 's2_10_30_2019'),
                  download_data(url[16], 's2_12_12_2019'))

# Create vector of the file names that can be used for visualization
s2_images_names <- list.files('data', pattern=glob2rx('s2*'))
for (i in 1:length(s2_images)){
  name <- sapply(strsplit(s2_images_names[i], split='.', fixed=TRUE), function(x) (x[1]))
  s2_images_names[i] <- name
}


