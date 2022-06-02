
from solid import scad_render_to_file

import OPSC_dimensions as od
from OPSC_insert import oi
from OPSC_dimensions import setMode

#from solid.objects import cube, cylinder, difference, translate, union

#import os, solid; print(os.path.dirname(solid.__file__) + '/examples')

od.setMode("3DPR")
#od.sertMode("LAZE")




a = (oi("cube",x=10,y=20,z=30,width=100,height=200,depth=300))
a = oi("cubeRounded",rotX=90,x=50,width=10,height=10,depth=30)


fileName = "OPSC_working.scad"

file_out = scad_render_to_file(a, fileName, file_header=f'$fn = 48;')
