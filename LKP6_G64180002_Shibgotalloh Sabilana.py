import cv2
import numpy as np
#from skimage.util import random_noise

#input citranya
citra = cv2.imread("bif.jpg")
# cv2.imshow("awal", citra)

#ubah rgb ke hsv dan lab
hsv = cv2.cvtColor(citra,cv2.COLOR_BGR2HSV)
lab = cv2.cvtColor(citra, cv2.COLOR_BGR2LAB)
gray = cv2.cvtColor(citra, cv2.COLOR_BGR2GRAY)
# cv2.imshow("hsv", hsv)
# cv2.imshow("lab", lab)
# cv2.imshow("gray", gray)


#split per channel dari rgb, hsv, lab
h, s, v = cv2.split(hsv)
l, a, b = cv2.split(lab)
red, green, blue = cv2.split(citra)

##cek output setiap channel
# cv2.imshow("h", h)
# # cv2.imshow("s", s)
# # cv2.imshow("v", v)
# cv2.imshow("l", l)
# cv2.imshow("a", a)
# cv2.imshow("b", b)
cv2.imshow("r", red)
cv2.imshow("g", green)
cv2.imshow("b2", blue)

#menghilangkan blur/noise
median = cv2.medianBlur(a, 5)
# cv2.imshow("median", median)

#ambil nilai minimal dan maksimal (ceknya? coba satu-satu)
lower = 137
upper = 250
#menghilangkan citra diluar range
mask = cv2.inRange(median, lower, upper)
#cv2.imshow("mask", mask)

# Lakukan segmentasi objek tersebut kembali ke semula
output = cv2.bitwise_and(citra, citra, mask=mask)
# cv2.imshow("blue", output)


#buat kernel untuk proses (perocobaan = 3x3, 5x5, 7x7)
kernel = np.ones((3,3), np.uint8)
#proses dilatasi (percobaan iterasi 1-5)
dilatasi = cv2.dilate(output, kernel, iterations=1)
dilatasi2 = cv2.dilate(output, kernel, iterations=2)
dilatasi3 = cv2.dilate(output, kernel, iterations=3)
dilatasi4 = cv2.dilate(output, kernel, iterations=4)
dilatasi5 = cv2.dilate(output, kernel, iterations=5)

#proses erosi (kurang lebih sama kaya dilatasi)
erosi1 = cv2.erode(output, kernel, iterations=1)
erosi2 = cv2.erode(output, kernel, iterations=2)
erosi3 = cv2.erode(output, kernel, iterations=3)
erosi4 = cv2.erode(output, kernel, iterations=4)
erosi5 = cv2.erode(output, kernel, iterations=5)


#cek output hasil
# cv2.imshow("blue", dilatasi)
cv2.waitKey()

# cv2.imwrite("ekernel3it1.png", dilatasi)
# cv2.imwrite("ekernel3it2.png", dilatasi2)
# cv2.imwrite("ekernel3it3.png", dilatasi3)
# cv2.imwrite("ekernel3it4.png", dilatasi4)
# cv2.imwrite("ekernel3it5.png", dilatasi5)


