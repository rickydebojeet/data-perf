import sys
import random


f = open(sys.argv[1], "w")

charsin1 = 1024 * 1024

for i in range(charsin1 * int(sys.argv[2])):
    f.write(chr(ord('a') + random.randint(0,25)))

f.close()