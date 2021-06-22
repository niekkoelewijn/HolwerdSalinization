# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

source("./R/download_data.R")

# Load the sentinel images 
# url <- list('https://drive.google.com/uc?export=download&id=1P8D2EAA6JSN4lSQK0LFGr2OUJdOwe2AH',
#             'https://drive.google.com/uc?export=download&id=1yq1qrcnzz_5QsDnntbaNX0j9WqerXkjj',
#             'https://drive.google.com/uc?export=download&id=1Jb1lSHokmZkUjYWg5-DkHuGinfLahN8i',
#             'https://drive.google.com/uc?export=download&id=10silm8Mo-bZEX6WMIhUVZkSMBTGCoRoF',
#             'https://drive.google.com/uc?export=download&id=12H6oaLAag7kt2j7zeYAeo0ig2-KgdC16',
#             'https://drive.google.com/uc?export=download&id=1i8FbUCt6RTus-i3kJv9br0bDAMipUs4r',
#             'https://drive.google.com/uc?export=download&id=1VnEuV3Nj4_-FCCIpoFPRLLSmukNa4K2U',
#             'https://drive.google.com/uc?export=download&id=1f1swD1HQupCXK9PgmiqXNI_ghZgUxXuz',
#             'https://drive.google.com/uc?export=download&id=1k1FoWI2HrP9vdNrUVVtTipTghk3Zn5ON',
#             'https://drive.google.com/uc?export=download&id=1NmTOcazG_alwU-2LenvtrXVKg-6GysDp',
#             'https://drive.google.com/uc?export=download&id=1T3H1zpsBXBFSUoUb0sZNDp6ugYHtJiNq',
#             'https://drive.google.com/uc?export=download&id=1VQERkPnHjsV9Y-iPYX_a6Ru5gPuuTN7J',
#             'https://drive.google.com/uc?export=download&id=1jvh_-zlvBpc9Qi43zud_T2s4VYg1k_WJ',
#             'https://drive.google.com/uc?export=download&id=1O-NMjJ4RoYql_Wiykj9ro1JmlY_ZsqW3',
#             'https://drive.google.com/uc?export=download&id=1DYdQcdOU5qQinTVqXNQERn95xGUrBbux',
#             'https://drive.google.com/uc?export=download&id=1bnhX5cUzySLn5U1YA9BgB1ycHgklGAbD',
#             'https://drive.google.com/uc?export=download&id=1qWzpvsuHhYBgexpLyk63FPSREj_P0TlO')

#Download the data from google drive and return them as a raster stack
# s2_images <- list(DownloadData(url[1], 's2_20151116'),
#                   DownloadData(url[2], 's2_20161230'),
#                   DownloadData(url[3], 's2_20170208'),
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
# for (i in 1:17){
#   name <- sapply(strsplit(s2_images_names[i], split='.', fixed=TRUE), function(x) (x[1]))
#   s2_images_names[i] <- name
# } 
