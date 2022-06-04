import cv2
import numpy as np

QTD_PIXELS = 4

img = cv2.imread('grego1.png', 0)
height,width = img.shape
print(height, width)
aux = []

for i in range(0, height-1, QTD_PIXELS):
    for j in range(0, width-1, QTD_PIXELS):
        media = 0
        for m in range(QTD_PIXELS):
            for n in range(QTD_PIXELS):
                try:
                    media += img[i+m,j+n]
                except:
                    print('Fora do range')
        media /= QTD_PIXELS*2
        aux.append(media)


new_image = np.zeros((int(height/QTD_PIXELS), int(width/QTD_PIXELS), 1), np.uint8)
for i in range(int(height/QTD_PIXELS)):
    for j in range(int(width/QTD_PIXELS)):
        try:
            new_image[i,j] = aux[(i*int(width/QTD_PIXELS))+j]
        except:
            print('Fora do range')

cv2.imwrite('decreasedDPI.png', new_image)
