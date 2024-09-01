import extractor
import random

import matplotlib.pyplot as plt
import numpy as np
import math

size = 500

v_first = extractor.DoubleVector(size)
for i in range(len(v_first)):
    v_first[i] = random.random() + (math.sin(i / 20.) + 0.5) + (math.cos(i / 7.) + 0.5) * 0.2

my_extractor = extractor.InstFreqNormSincExtractorReq()
my_extractor.locality_coeff = 5
my_extractor.period_muller = 1.05
my_extractor.max_iter_number_for_filter = 3
my_extractor.computeVec(data_in=v_first)

print(my_extractor.getDataSize(), my_extractor.getModesCount())

x = np.linspace(0, my_extractor.getDataSize()-1,my_extractor.getDataSize())
print(x.shape)
ploting_data = []
for i in range(len(v_first)):
    ploting_data.append(v_first[i])
plt.plot(x, ploting_data)
plt.show()


for i in range(my_extractor.getModesCount()):
    v = my_extractor.getMode(i)
    #v = my_extractor.getInstFreq(i)
    #v = my_extractor.getInstAmpl(i)
    #v = my_extractor.getPhase(i)
    ploting_data = []
    #print(v.size())
    for j in range(len(v)):
        ploting_data.append(v[j])
    plt.plot(x, ploting_data)
    plt.show()

    for j in range(len(v_first)):
        v_first[j] = v_first[j] - v[j]

    ploting_data = []
    for j in range(len(v_first)):
        ploting_data.append(v_first[j])
    plt.plot(x, ploting_data)
    plt.show()


'''
tokenizer = extractor.InstFreqNormSincTokenizer()
tokenizer.locality_coeff = 2.5
tokenizer.period_muller = 1.02

v = extractor.DoubleVector(size)
for i in range(len(v)):
    v[i] = random.random()

tokenizer.computeVec(v)

tokens = tokenizer.getTokens()
for token in tokens:
    print(token.mode_num, token.t, token.val, 
          token.inst_freq, token.inst_ampl, token.phase)
'''