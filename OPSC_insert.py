import subprocess

import OPSC_dimensions as od
from solid.objects import *
from solid import scad_render_to_file


def setMode(mode="3DPR"):
    od.changeMode(mode)

def getMode():
    return od.mode



def saveToScad(fileName, parts):
    file_out = scad_render_to_file(parts, fileName, file_header=f'$fn = 48;')


def saveToDxf(fileIn, fileOut=""):
    if fileOut == "":
        fileOut = fileIn.replace(".scad",".dxf")
    saveToFile(fileIn, fileOut)
    
def saveToPng(fileIn, fileOut="",extra="--render"):
    if fileOut == "":
        fileOut = fileIn.replace(".scad",".png")
    saveToFile(fileIn, fileOut)

def saveToStl(fileIn, fileOut=""):
    if fileOut == "":
        fileOut = fileIn.replace(".scad",".stl")
    saveToFile(fileIn, fileOut)

def saveToFile(fileIn, fileOut,extra=""):


    launchStr = 'openscad -o "' + fileOut + '"' + extra + ' "' + fileIn + '"'
    print("saveToFile launch string: " + launchStr)
    subprocess.run(launchStr)
    x=0



def insert(item,pos=[None,None,None],x=0,y=0,z=0,ex=0,size=[None,None,None],length=0,rot=[None,None,None],rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color=od.colDefault,alpha=1,OOwidth=0,OOheight=0,holes=True,negative=True, name=""):
    return OPSCInsert(item,pos,x,y,z,ex,size,length,rot,rotX,rotY,rotZ,width,height,depth,rad,rad2,color,alpha,OOwidth,OOheight,holes,negative,name)


def OPSCInsert(item,pos=[None,None,None],x=0,y=0,z=0,ex=0,size=[None,None,None],length=0,rot=[None,None,None],rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,col=od.colDefault,alpha=1,OOwidth=0,OOheight=0,holes=True,negative=True, name=""):
    
    """
        color(color,alpha){
            translate([x,y,z]){
                    rotate([rotX,rotY,rotZ]){
    """
    returnValue = ""

    #print(pos)

    if pos[0] != None:
        x=pos[0]
        y=pos[1]
        z=pos[2]
    if rot[0] != None:
        rotX=rot[0]
        rotY=rot[1]
        rotZ=rot[2]
    
    returnValue = color(col)(translate((x,y,z))(
                            rotate((rotX,rotY,rotZ))(
                                OPSCInsertIf(item,pos,x,y,z,ex,size,length,rot,rotX,rotY,rotZ,width,height,depth,rad,rad2,col,alpha,OOwidth,OOheight,holes,negative,name)
                            )
                        ))
                
    

    return returnValue

def OPSCInsertIf(item,pos=[None,None,None],x=0,y=0,z=0,ex=0,size=[None,None,None],length=0,rot=[None,None,None],rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color=od.colDefault,alpha=1,OOwidth=0,OOheight=0,holes=True,negative=True, name=""):
    returnValue = cube([10,10,10])

    if size[0] != None:
        width=size[0]
        height=size[1]
        depth=size[2]

    #print("    OPSCInsert item:" + str(item) + " at:[" + str(x) + "," + str(y) + "," + str(z) + "] size: [" + str(width) + "," + str(height) + "," + str(depth) + "]")

    if(item=="cube"):
        returnValue =  translate([0,0,-depth/2])(cube([width,height,depth],center=True))
    elif(item=="cylinder"):        
        returnValue = translate([0,0,-depth/2])(cylinder(r=rad,h=depth,center=True))
    elif(item=="sphere"):        
        returnValue = translate([0,0,-rad])(sphere(r=rad))
    elif(item=="plane"):
        returnValue = insert("cube",size=[1000,1000,0.1],color=color)    
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
    ######  Countersunk
    elif(item == "countersunkM1" or item == "csM1" ):
        returnValue = OSPCgetCountersunk(rad=1)
    elif(item == "countersunkM2" or item == "csM2" ):
        returnValue = OSPCgetCountersunk(rad=2)
    elif(item == "countersunkM3" or item == "csM3" ):
        returnValue = OSPCgetCountersunk(rad=3)
    elif(item == "countersunkM4" or item == "csM4" ):
        returnValue = OSPCgetCountersunk(rad=4)
    elif(item == "countersunkM5" or item == "csM5" ):
        returnValue = OSPCgetCountersunk(rad=5)
    elif(item == "countersunkM6" or item == "csM6" ):
        returnValue = OSPCgetCountersunk(rad=6)
    elif(item == "countersunk" or item == "cs"):
        returnValue = OSPCgetCountersunk(rad=rad)


    ######  Holes    
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

    ######  Nuts
    elif(item == "nutM1"):
        returnValue = OSPCgetNut(rad=1,depth=depth)
    elif(item == "nutM2"):
        returnValue = OSPCgetNut(rad=2,depth=depth)
    elif(item == "nutM3"):
        returnValue = OSPCgetNut(rad=3,depth=depth)
    elif(item == "nutM4"):
        returnValue = OSPCgetNut(rad=4,depth=depth)
    elif(item == "nutM5"):
        returnValue = OSPCgetNut(rad=5,depth=depth)
    elif(item == "nutM6"):
        returnValue = OSPCgetNut(rad=6,depth=depth)
    elif(item == "nut"):
        returnValue = OSPCgetNut(rad=rad,depth=depth)
    return returnValue

                

def OSPCgetHole(rad):
    return translate([0,0,-250])(cylinder(r=od.holeM[rad],h=500))

def OSPCgetNut(rad,depth):
    depth = od.nutM[rad][od.NUTDEPTH] if depth==100 else depth
    returnValue = OPSChexagon(od.nutM[rad][od.NUTWIDTH],depth=depth)
    return returnValue

def OSPCgetCountersunk(rad):
    depth=od.countersunkM[rad][od.DEPTH]
    returnValue = translate([0,0,-depth])(cylinder(h=depth,r2=od.countersunkM[rad][od.WIDTH],r1=od.holeM[rad]))
    return returnValue

def OPSChexagon(width,depth):
    cutter = item()
    wid=width*2
    cutter.addPos(insert("cube",pos=[wid/2+width/2,0,0],size=[wid,wid,depth]))
    cutter.addPos(insert("cube",pos=[-wid/2-width/2,0,0],size=[wid,wid,depth]))

    cut = cutter.getPart()
    #print(depth)
    returnValue = difference()(
        translate([0,0,-depth/2])(cube([wid,wid,depth],center=True)),
        cut,
        rotate([0,0,60])(cut),
        rotate([0,0,-60])(cut)
    )

    return returnValue




class item:

    def __init__(self):
        self.posItems=list()
        self.negItems=list()


    def addPos(self,part):
        self.posItems.append(part)
    def addNeg(self,part):
        self.negItems.append(part)

    def getPart(self):
        returnValue = difference()(
            union()(self.posItems),
            union()(self.negItems)
        )
        return returnValue

    def getLaser(self,start=0,layers=1,thickness=-3,tileDif=200):
        rv= []

        for x in range(layers):
            rv.append(translate([0,x*tileDif,0])(
                    projection()(
                        intersection()(
                            insert("plane",z=start+x*thickness),
                            self.getPart()
                        )
                    )
            )
            )
        return union()(rv)

    def getSplit(self,start=0,depth=6,tileDif=200):
        rv= []

        rv.append(translate([0,0,0])(
            intersection()(
                insert("cube",size=[100,100,depth],z=start),
                self.getPart()
            )
        )
        )

        rv.append(translate([0,tileDif,depth])(
            intersection()(
                insert("cube",size=[100,100,depth],z=start-depth),
                self.getPart()
            )
        )
        )        
        return union()(rv)
