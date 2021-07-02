import numpy as np
import cv2

# buka citra file
img = cv2.imread('lenna.png')


# mengubah citra dari rgb ke hsv
hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)


# melakukan split pada setiap hue saturation dan value
h, s, v = cv2.split(hsv)
row, col, ch = img.shape

# mencari nilai rata-rata dari setiap poin
mean_h = np.average(h)
mean_s = np.average(s)
mean_v = np.average(v)

# melakukan thresholding, apabila nilai diatas rata2 maka diubah menjadi 255 dan jika tidak menjadi nol
for p in range (0, row):
    for q in range (0, col):
        if h[p,q] >= mean_h:
            h[p,q] = 255
        else:
            h[p,q] = 0

for p in range (0, row):
    for q in range (0, col):
        if s[p,q] >= mean_s:
            s[p,q] = 255
        else:
            s[p,q] = 0

for p in range (0, row):
    for q in range (0, col):
        if v[p,q] >= mean_v:
            v[p,q] = 255
        else:
            v[p,q] = 0

# output yang dihasilkan
cv2.imshow("input", h)
cv2.imshow("input2", s)
cv2.imshow("input3", v)

cv2.waitKey(0)