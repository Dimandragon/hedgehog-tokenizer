import extractor
import random

import matplotlib.pyplot as plt
import numpy as np
import math

size = 500

v_first = extractor.DoubleVector(size)
for i in range(len(v_first)):
    v_first[i] = random.random() + (math.sin(i / 20.) * 0.5) + (math.cos(i / 7.) + 0.5) * 0.2

x = np.linspace(0, size-1, size)
print(x.shape)
ploting_data = []
for i in range(len(v_first)):
    ploting_data.append(v_first[i])
plt.plot(x, ploting_data)
plt.show()

phase_shifts = extractor.DoubleVector()
for i in range (0, 100):
    phase_shifts.append(i * 0.01 * math.pi)

my_extractor = extractor.MakimaBasedModeDecomposition()
my_extractor.max_iter_number_for_filter = 10
my_extractor.phase_shifts = phase_shifts
my_extractor.computeVec(data_in=v_first)

print(my_extractor.getDataSize(), my_extractor.getModesCount())


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
    #plt.plot(x, ploting_data)
    #plt.show()


tokenizer = extractor.MakimaModeDecompositionBasedTokenizer()
tokenizer.max_iter_number_for_filter = 10
tokenizer.phase_shifts = phase_shifts

v = extractor.DoubleVector(size)
for i in range(len(v)):
    v[i] = random.random()

tokenizer.computeVec(v)

tokens = tokenizer.getTokens()
for token in tokens:
    print(token.mode_num, token.t, token.val, 
          token.inst_freq, token.inst_ampl, token.phase)

print("complete decomposition")

print("start testing tokens count by 1000 iters")

count = len(tokenizer.getTokens())
for i in range(0, 1000):
    v = extractor.DoubleVector(size)
    for j in range(len(v)):
        v[j] = random.random()
        for k in range(0, 50):
            v[j] += math.sin(random.random()) * random.random() + math.cos(random.random()) * random.random()
    tokenizer.computeVec(v)
    count_ = len(tokenizer.getTokens())
    if count_ > count:
        count = count_
print(count)
