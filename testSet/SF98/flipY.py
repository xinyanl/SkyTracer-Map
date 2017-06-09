import glob
import os 
import sys

dir = sys.argv[1]
os.chdir(dir)
pwd = os.getcwd()

for zDir in glob.glob('*/'):
    zoom = int(zDir[:-1])
    ymax = 1 << zoom
    os.chdir(pwd+'/'+zDir)
    for xyDir in glob.glob('*/*.png'):
        xDir, yDir = xyDir.split('/')
        yName = yDir.split('.')[0]
        newYName = str(ymax - int(yName) - 1)
        os.system('mv '+xyDir+' '+xDir+'/'+newYName+'.png')
    print 'Done with renaming '+zDir
    os.chdir(pwd)
