import cv2
import numpy as np
import matplotlib.pyplot as plt

nome_arquivo = 'homer.png'

img = cv2.imread(nome_arquivo)
gray = cv2.imread(nome_arquivo, 0)

height, width, channels = img.shape

hist = cv2.calcHist([gray],[0],None,[256],[0,256])
copia = hist

plt.hist(img.ravel(), 256, [0, 256])
plt.show()

total = 0
maximo = 0
minimo = 0


for valor in hist:
    if valor[0] > maximo:
        maximo = valor[0]

for k, valor in enumerate(hist):
    copia[k][0] = 255*((valor[0]-minimo)/(maximo-minimo))

for valor in copia:
    total += valor[0]


media = total / len(copia)
print(total)
print(media)
print(len(copia))
plt.plot(copia, color='b')

for valor in copia:
    if valor[0] <= media:
        valor[0] = 0
    else:
        valor[0] = 255

plt.plot(copia, color='g')
plt.xlim([0, 255])
plt.ylim([0, 255])
plt.show()


equ = cv2.equalizeHist(gray)
res = np.hstack((gray, equ))

cv2.imwrite('teste_junto.png', res)