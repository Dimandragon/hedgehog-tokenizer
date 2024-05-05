# file: runme.py
import extractor
import random

import matplotlib.pyplot as plt
import numpy as np

size = 500

v = extractor.DoubleVector(size)
for i in range(len(v)):
    v[i] = random.random()

for i in range(len(v)):
    print(v[i])

extractor = extractor.InstFreqNormSincExtractor()
extractor.locality_coeff = 2.5
extractor.period_muller = 1.02

extractor.computeVec(data_in=v)

print(extractor.getDataSize(), extractor.getModesCount())

x = np.linspace(0, extractor.getDataSize()-1,extractor.getDataSize())
print(x.shape)
ploting_data = []
for i in range(500):
    ploting_data.append(v[i])
plt.plot(x, ploting_data)
plt.show()


for i in range(extractor.getModesCount()):
    v = extractor.getMode(i)
    # v = extractor.getInstFreq(i)
    # v = extractor.getInstAmpl(i)
    # v = extractor.getPhase(i)
    ploting_data = []
    #print(v.size())
    for j in range(len(v)):
        ploting_data.append(v[j])
    plt.plot(x, ploting_data)
    plt.show()
'''