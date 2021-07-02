import cv2
import numpy as np
import os

#import image yang akan dipakai
img = cv2.imread("lenna.png")
row, col, ch = img.shape
grayScale = np.zeros((row, col, 1), np.uint8)
#mengubah image menjadi grayscale
for k in range (0, row):
    for l in range (0, col):
        blue, green, red = img[k,l]
        Gray = (red * 0.299 + green * 0.587 + blue * 0.114)
        grayScale.itemset((k,l,0), Gray)

#menambah padding bernilai 0 disekelilingnya
def padding(image):
    row, col, ch = image.shape
    pading = np.zeros((row + 1, col + 1), np.uint8)
    for i in range(0,row):
        for j in range(0,col):
            pading[i, j] = image[i, j]
    return pading

#proses konvolusi
def konvo(image, kernel):
    row2, col2 = kernel.shape
    row, col, ch = image.shape
    #memanggil fungsi untuk menambahkan padding
    image = padding(image)
    hasil = np.zeros((row, col), np.uint8)
    #proses dari konvolusi
    for i in range(0, row):
        for j in range(0, col):
            imagesum = 0
            for k in range(int(-row2/2), row2-int(row2/2)):
                for l in range(int(-col2/2), col2-int(col2/2)):
                    if i+k >= 0 and j+l >= 0:
                        imagesum += image[i+k,j+l] * kernel[k+int(row2/2), l+int(col2/2)]
                        hasil[i,j] = imagesum

    return hasil

#kernel yang akan figunakan
#kernel dari low Pass filter
kernelSize1 = np.array([[1, 2, 1],
                        [2, 4, 2],
                        [1, 2, 1]])
#kernel dari High pass filter
kernelSize2 = np.array([[-1/9, -1/9, -1/9],
                         [-1/9, 8/9, -1/9],
                         [-1/9, -1/9, -1/9]])
#kernel dari direectional filter
kernelSize3 = np.array([[-1, 0, 1],
                         [-1, 0, 1],
                         [-1, 0, 1]])

#fungsi yang akan memanggil ketiga citra tadi
low = konvo(grayScale, kernelSize1)
high = konvo(grayScale, kernelSize2)
direct = konvo(grayScale, kernelSize3)

#perintah untuk menampilkan ketiga citra
#cv2.imshow("directional", direct)
cv2.imshow("lpf", low)
#cv2.imshow("hpf", high)

cv2.waitKey(0)

