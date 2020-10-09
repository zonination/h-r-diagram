import os
import glob

files = glob.glob('star_anim*.png')
files.sort()

n = 0
for star in files:
    print('mv {0} {1}'.format(star, star[:9]) + '{:03d}'.format(n) + '.png')
    os.system('mv {0} {1}'.format(star, star[:9]) + '{:03d}'.format(n) + '.png')
    n = n + 1
