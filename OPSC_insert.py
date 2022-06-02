import OPSC_dimensions as od
from solid.objects import cube, cylinder, difference, translate, union, hull, rotate, linear_extrude, square, offset
from solid import scad_render_to_file


def saveToFile(fileName, parts):
    file_out = scad_render_to_file(parts, fileName, file_header=f'$fn = 48;')


def insert(item,name="",pos=[None,None,None],x=0,y=0,z=0,ex=0,size=[None,None,None],length=0,rot=[None,None,None],rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=True,negative=True):
    return OPSCInsert(item,pos,x,y,z,ex,size,length,rot,rotX,rotY,rotZ,width,height,depth,rad,rad2,color,alpha,OOwidth,OOheight,holes,negative,name)


def OPSCInsert(item,pos=[None,None,None],x=0,y=0,z=0,ex=0,size=[None,None,None],length=0,rot=[None,None,None],rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=True,negative=True, name=""):
    
    """
        color(color,alpha){
            translate([x,y,z]){
                    rotate([rotX,rotY,rotZ]){
    """
    returnValue = ""
    print(pos)

    if pos[0] != None:
        x=pos[0]
        y=pos[1]
        z=pos[2]
    if rot[0] != None:
        rotX=rot[0]
        rotY=rot[1]
        rotZ=rot[2]
    
    returnValue = translate((x,y,z))(
            rotate((rotX,rotY,rotZ))(
                OPSCInsertIf(item,pos,x,y,z,ex,size,length,rot,rotX,rotY,rotZ,width,height,depth,rad,rad2,color,alpha,OOwidth,OOheight,holes,negative,name)
            )
        )
    

    return returnValue

def OPSCInsertIf(item,pos=[None,None,None],x=0,y=0,z=0,ex=0,size=[None,None,None],length=0,rot=[None,None,None],rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=True,negative=True, name=""):
    returnValue = cube([10,10,10])

    if size[0] != None:
        width=size[0]
        height=size[1]
        depth=size[2]

    print("    OPSCInsert item:" + str(item) + " at:[" + str(x) + "," + str(y) + "," + str(z) + "]")

    if(item=="cube"):
        returnValue =  cube([width,height,depth],center=True)
    elif(item=="cylinder"):        
        returnValue = cylinder(r=rad,h=depth,center=True)
    elif(item=="cubeRounded"):
        if(rad == 0):
                            rad = 5
        returnValue =  translate([0,0,-depth])(
                        linear_extrude(height=depth)(                        
                            offset(r=rad)(
                                square((width-rad*2+.01,height-rad*2+.01),center=True)
                                )
                            )
        )
    elif(item == "holeM1"):
        returnValue = OSPCgetHole(rad=1)
    elif(item == "holeM2"):
        returnValue = OSPCgetHole(rad=2)
    elif(item == "holeM3"):
        returnValue = OSPCgetHole(rad=3)
    elif(item == "holeM4"):
        returnValue = OSPCgetHole(rad=4)
    elif(item == "holeM5"):
        returnValue = OSPCgetHole(rad=5)
    elif(item == "holeM6"):
        returnValue = OSPCgetHole(rad=6)
    elif(item == "hole"):
        returnValue = OSPCgetHole(rad=rad)
    return returnValue

                

def OSPCgetHole(rad):
    return translate([0,0,-250])(cylinder(r=od.holeM[rad-1],h=500))



