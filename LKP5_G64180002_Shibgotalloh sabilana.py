
import cv2
import numpy as np

img = cv2.imread("melon.jpeg")
hsv = cv2.cvtColor(img,cv2.COLOR_BGR2HSV)
lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
h, s, v = cv2.split(hsv)
l, a, b = cv2.split(lab)

def fungsi1(hsv):
    lower = np.array([10, 200, 200])
    upper = np.array([179, 255, 255])
    mask = cv2.inRange(hsv, lower, upper)
    output = cv2.bitwise_and(hsv, hsv, mask=mask)
    hasil = cv2.cvtColor(output, cv2.COLOR_HSV2BGR)

    return hasil
#34,126,171
def fungsi2(lab):
    lower = np.array([35,135,185])
    upper = np.array([255,255 ,255])
    mask = cv2.inRange(lab, lower, upper)
    output = cv2.bitwise_and(lab, lab, mask=mask)
    hasil = cv2.cvtColor(output, cv2.COLOR_LAB2BGR)

    return hasil

hasil_hsv = fungsi1(hsv)
hasil_lab = fungsi2(lab)

cv2.imshow("hsv", hasil_hsv)
cv2.imshow("lab", hasil_lab)
cv2.imwrite("cek6.png", hasil_lab)
#cv2.imshow("melon", img)
#cv2.imshow("melon2", a)
#cv2.imshow("melon3", b)
cv2.waitKey(0)
