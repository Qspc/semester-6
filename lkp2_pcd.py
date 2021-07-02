import numpy as np
import cv2

# membuka citra
img = cv2.imread('lenna.png')
img2 = cv2.imread('equ_gray.png')


# assign row col
row, col, ch = img.shape
row, col, ch = img2.shape
# buat salinan dari citra yang akan dijadikan grayscale
#img_gray = img.copy()
#img_gray2 = img2.copy()

# mengubah citra digital menjadi greyscale
grayScale = np.zeros((row, col, 1), np.uint8)
for k in range (0, row):
    for l in range (0, col):
        blue, green, red = img[k,l]
        Gray = (red * 0.299 + green * 0.587 + blue * 0.114)
        grayScale.itemset((k,l,0), Gray)

grayScale2 = np.zeros((row, col, 1), np.uint8)
for k in range (0, row):
    for l in range (0, col):
        blue, green, red = img2[k,l]
        Gray = (red * 0.299 + green * 0.587 + blue * 0.114)
        grayScale2.itemset((k,l,0), Gray)

#menghitung nilai rata-rata setiap citra
mean = np.average(grayScale)
mean2 = np.average(grayScale2)

#mengubah nilai citra jika lebih besar dari rata2 dikali 1, jika kurang dikali 0.5
for p in range (0, row):
    for q in range (0, col):
        if grayScale[p,q] >= mean:
            grayScale[p,q] = grayScale2[p,q]
        else:
            grayScale[p,q] = grayScale[p,q]*0.5

for p in range (0, row):
    for q in range (0, col):
        if grayScale2[p,q] >= mean2:
            grayScale2[p,q] = grayScale2[p,q]
        else:
            grayScale2[p,q] = grayScale2[p,q]*0.5

#mengurangi antara citra1 dan citra2
substraction = cv2.subtract(grayScale, grayScale2)

#menampilkan hasilnya
#cv2.imshow("input", grayScale)
#cv2.imshow("input2", grayScale2)
cv2.imshow("input3", substraction)
cv2.waitKey(0)
