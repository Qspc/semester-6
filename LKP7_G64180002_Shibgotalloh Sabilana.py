import cv2
import numpy as np
import math
img = cv2.imread('citrus.jpg')
gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
gray = cv2.medianBlur(gray,11)
circles = cv2.HoughCircles(gray,cv2.HOUGH_GRADIENT,2,50,
            param1=50,param2=30,minRadius=90,maxRadius=100)
circles = np.uint16(np.around(circles))

for i in circles[0,:]:
 # draw the outer circle
 cv2.circle(img,(i[0],i[1]),i[2],(0,255,0),2)
 # draw the center of the circle
 cv2.circle(img,(i[0],i[1]),2,(0,0,255),3)
 print("cx: {}, cy: {}, radius: {}".format(i[0],i[1], i[2]))

cv2.imshow('detected circles',img)
cv2.imwrite("hasil2.png", img)

img = cv2.imread('building.jpg')
gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
edges = cv2.Canny(gray,200,220,apertureSize = 3)
cv2.imshow("img", img)
lines = cv2.HoughLines(edges,1,np.pi/180,200)
for i in range(0, len(lines)):
 rho = lines[i][0][0]
 theta = lines[i][0][1]
 a = math.cos(theta)
 b = math.sin(theta)
 x0 = a*rho
 y0 = b*rho
 x1 = int(x0 + 1000*(-b))
 y1 = int(y0 + 1000*(a))
 x2 = int(x0 - 1000*(-b))
 y2 = int(y0 - 1000*(a))
 cv2.line(img,(x1,y1),(x2,y2),(0,200,255),2)
print(lines[0])
cv2.imshow('houghlines3.jpg',img)
cv2.waitKey(0)