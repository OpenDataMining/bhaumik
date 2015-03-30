install.packages("spatstat");
library(spatstat);

install.packages("jpeg");
library(jpeg);

img = readJPEG("C:\\Users\\Bhaumik\\Documents\\GitHub\\OpenDataMining\\bhaumik\\FeatureEngineering\\ImageData\\Data\\roofs2.jpg");

# Convert to GrayScale - 0.2989 * R + 0.5870 * G + 0.1140 * B
imgGray = 0.2989 * img[, , 1] + 0.587 * img[, , 2] + 0.114 * img[, , 3];
imgGrayMat = matrix(imgGray, nrow = dim(img)[1], ncol = dim(img)[2], byrow = FALSE);

sobelFilterX = matrix(c(-1, -2, -1, 0, 0, 0, 1, 2, 1), nrow = 3, ncol = 3, byrow = TRUE);
sobelFilterY = matrix(c(-1, -2, -1, 0, 0, 0, 1, 2, 1), nrow = 3, ncol = 3, byrow = FALSE);

# Convolve image with Sobel filters
convolvedX = convolve.im(as.im(sobelFilterX), as.im(imgGrayMat), reflectX=TRUE);
convolvedY = convolve.im(as.im(sobelFilterY), as.im(imgGrayMat), reflectX=TRUE);

writeJPEG(convolvedX$v, target = "C:\\Users\\Bhaumik\\Documents\\GitHub\\OpenDataMining\\bhaumik\\FeatureEngineering\\ImageData\\Data\\roofs2ConvolvedX.jpg");
writeJPEG(convolvedY$v, target = "C:\\Users\\Bhaumik\\Documents\\GitHub\\OpenDataMining\\bhaumik\\FeatureEngineering\\ImageData\\Data\\roofs2ConvolvedY.jpg");