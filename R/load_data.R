# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

source("./R/download_data.R")

# Load the sentinel images 
url <- list('https://drive.google.com/uc?export=download&id=1P_sfP5CVMkuzrpo7d1RpG8-GbGKcIdT0')
            

#Download the data from google drive and return them as a raster stack
s2_images <- list(DownloadData(url[1], 's2_april'))
#                    DownloadData(url[3], 's2_20170208'),
#                   DownloadData(url[4], 's2_20171110'),
#                   DownloadData(url[5], 's2_20171130'),
#                   DownloadData(url[6], 's2_20171230'),
#                   DownloadData(url[7], 's2_20180129'),
#                   DownloadData(url[8], 's2_20180228'),
#                   DownloadData(url[9], 's2_20180320'),
#                   DownloadData(url[10], 's2_20180628'),
#                   DownloadData(url[11], 's2_20180916'),
#                   DownloadData(url[12], 's2_20181210'),
#                   DownloadData(url[13], 's2_20191115'),
#                   DownloadData(url[14], 's2_20200203'),
#                   DownloadData(url[15], 's2_20200508'),
#                   DownloadData(url[16], 's2_20201020'),
#                   DownloadData(url[17], 's2_20210118'))

# Create vector of the file names that can be used for visualization
# s2_images_names <- list.files('data', pattern=glob2rx('s2*'))
for (i in 1:length(s2_images)){
  name <- sapply(strsplit(s2_images_names[i], split='.', fixed=TRUE), function(x) (x[1]))
  s2_images_names[i] <- name
}
