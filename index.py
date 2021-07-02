import numpy as np
import cv2
import matplotlib.pyplot as plt
img = cv2.imread("melon.jpeg")
#plt.hist(img.ravel(), 256, [0,256])

row, col, ch = img.shape
min = 255
max = 0
grayScale = np.zeros((row, col, 1), np.uint8)
for k in range (0, row):
    for l in range (0, col):
        blue, green, red = img[k,l]
        Gray = (red * 0.299 + green * 0.587 + blue * 0.114)
        grayScale.itemset((k,l,0), Gray)
        if grayScale[k,l] > max:
            max = grayScale[k,l]
        if grayScale[k,l] < min:
            min = grayScale[k,l]
#cv2.imshow("input2", grayScale)


for x in range (0, row):
    for y in range (0, col):
        grayScale[x,y] = (grayScale[x,y]-min) / (max-min) * 255

cv2.imshow("input3", grayScale)
cv2.waitKey(0)
plt.hist(grayScale.ravel(),256,[0,256])
plt.show()



def komulatif(grayscale):
    p, l = grayScale.shape
    nilai = 0
    panjang = p*l
    hitung1 = [i/panjang for i in 256]
    total=[]
    for i in range(255):
        nilai = nilai + hitung1[i]
        total.append(nilai)
    return total
def fungsi(grayscale):
    total = komulatif(grayScale)
    equ = [int(x * 255) for x in total]
    for i in range(p):
        for j in range(l):
            grayScale[i, j] = equ[grayScale[i, j]]
    return grayScale

equal = fungsi(grayScale)
cv2.imshow('equlize', equal)
cv2.waitKey(0)
plt.hist(grayScale.ravel(),256,[0,256])
plt.show()

