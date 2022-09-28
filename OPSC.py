import subprocess

from solid.objects import *
from solid import scad_render_to_file, scad_render

import math

import os

##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################
######  DIMENSION STUFF
##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################


mode = "3DPR"
#mode = "LAZE"
#mode = "TURE"
#mode = ""

d = {}

###### Bearings
d["BEARINGS"] = {}

######  Countersunk
countersunkM = []
WIDTH = 0
DEPTH = 1
countersunkM1width = 0; countersunkM1depth = 0; countersunkM2width = 0; countersunkM2depth = 0
countersunkM3width = 0
countersunkM3depth = 0
countersunkM4width = 0
countersunkM4depth = 0
countersunkM5width = 0
countersunkM5depth = 0
countersunkM6width = 0
countersunkM6depth = 0

######  Holes
d["HOLES"] = {}
holeM = []
holeM1 = 0
holeM2 = 0
holeM3 = 0
holeM4 = 0
holeM5 = 0
holeM6 = 0

######  Nuts
d["NUTS"] = {}


nutM = []
NUTWIDTH = 0
NUTDEPTH = 1
nutM1width = 0
nutM1depth = 0
nutM2width = 0
nutM2depth = 0
nutM3width = 0
nutM3depth = 0
nutM4width = 0
nutM4depth = 0
nutM5width = 0
nutM5depth = 0
nutM6width = 0
nutM6depth = 0

######  Plastic Rivet
d["PLASTICRIVET"] = {}

######  Socket Caps
d["SOCKETCAPS"] = {}



######  OOEB
ooebPinWidth = 0
ooebPinWidthWide = 0


######  Colors
colDefault = "Gold"

colOOEBbase = colDefault

colLEDRed = "red"
colWire = "gray"
    ######  Resistor
colRes = list()
colResistor = "beige"

colResBlack = "black"
colRes.append(colResBlack)
colResBrown = "brown"
colRes.append(colResBrown)
colResRed = "red"
colRes.append(colResRed)
colResOrange = "orange"
colRes.append(colResOrange)
colResYellow = "yellow"
colRes.append(colResYellow)
colResGreen = "green"
colRes.append(colResGreen)
colResBlue = "blue"
colRes.append(colResBlue)
colResPurple = "purple"
colRes.append(colResPurple)
colResGray = "gray"
colRes.append(colResGray)
colResWhite = "white"
colRes.append(colResWhite)





def changeMode(m="3DPR"):
    #print("####################################################      CHANGING MODES TO: " + m)
    global mode
    mode = m
    ######  Bearings
    bearingLip = 3/2
    bearingList = []
    bear = "606"
    #bearingList.append(bear)
    d["BEARINGS"]["606"] = { 
                        "BIG"           : 17/2,
                        "LITTLE"        : 14/2,
                        "INSIDE"        : 6/2,
                        "INSIDEBIG"     : 6/2 + bearingLip,
                        "OUTSIDE"       : 17/2,
                        "OUTSIDELITTLE" : 15/2,
                        "INSIDELITTLE"  : (6+1.5)/2,
                        "DEPTH"         : 6,
                        "BPHOLES"       : [9.445]
                        }
    bear = "6704"
    bearingList.append(bear)    
    d["BEARINGS"][bear] = { 
                        "BIG"           : 27/2,
                        "INSIDE"        : 20/2,
                        "DEPTH"         : 4,
                        "BPHOLES"       : [7]            
                        }
    bear = "6805"
    bearingList.append(bear)    
    d["BEARINGS"][bear] = { 
                        "BIG"           : 37/2,
                        "INSIDE"        : 25/2,
                        "DEPTH"         : 7,
                        "BPHOLES"       : [16,5.303]            
                        }
    bear = "6808"
    bearingList.append(bear)    
    d["BEARINGS"][bear] = { 
                        "BIG"           : 52/2,
                        "INSIDE"        : 40/2,
                        "DEPTH"         : 7,
                        "BPHOLES"       : [23,7]            
                        }

    bear = "6810"
    bearingList.append(bear)    
    d["BEARINGS"][bear] = { 
                        "BIG"           : 65/2,
                        "INSIDE"        : 50/2,
                        "DEPTH"         : 7,
                        "BPHOLES"       : [25,9.445]            
                        }
    
    for bear in bearingList:
        d["BEARINGS"][bear]["LITTLE"] = d["BEARINGS"][bear]["BIG"] - bearingLip
        d["BEARINGS"][bear]["INSIDEBIG"] = d["BEARINGS"][bear]["INSIDE"] + bearingLip
        d["BEARINGS"][bear]["OUTSIDE"] = d["BEARINGS"][bear]["BIG"]
        d["BEARINGS"][bear]["OUTSIDELITTLE"] = d["BEARINGS"][bear]["BIG"] - bearingLip
        d["BEARINGS"][bear]["INSIDELITTLE"] = d["BEARINGS"][bear]["INSIDE"]

    bearingClearance = 0.2
    if mode == "3DPR":
        d["BEARINGS"]["606"]["BIG"] =      17.5/2
        d["BEARINGS"]["606"]["LITTLE"] =   14.5/2
        d["BEARINGS"]["606"]["INSIDE"] =   5.8/2
        d["BEARINGS"]["606"]["OUTSIDE"] =  (17+0.25)/2
        d["BEARINGS"]["606"]["DEPTH"] =    6.5

        for bear in bearingList:         
            d["BEARINGS"][bear]["INSIDE"] =       (d["BEARINGS"][bear]["INSIDE"] -(bearingClearance/2))
            d["BEARINGS"][bear]["OUTSIDE"] =      d["BEARINGS"][bear]["BIG"] +(bearingClearance/2)
            d["BEARINGS"][bear]["INSIDELITTLE"] = d["BEARINGS"][bear]["INSIDE"] -(bearingClearance/2)
                           
    
    ######  Countersunk
    global countersunkM, countersunkM1width, countersunkM1depth, countersunkM2width, countersunkM2depth, countersunkM3width, countersunkM3depth, countersunkM4width, countersunkM4depth, countersunkM5width, countersunkM5depth, countersunkM6width, countersunkM6depth
    countersunkM = []
    countersunkM.append([0,0])
    countersunkM1width = 0 if mode== "3DPR" else 0
    countersunkM1depth = 0 if mode== "3DPR" else 0
    countersunkM.append([countersunkM1width,countersunkM1depth])
    countersunkM2width = 0 if mode== "3DPR" else 0
    countersunkM2depth = 0 if mode== "3DPR" else 0
    countersunkM.append([countersunkM2width,countersunkM2depth])
    countersunkM3width = 5.5/2+0.6 if mode== "3DPR" else 5.5/2
    countersunkM3depth = 1.7 if mode== "3DPR" else 1.7
    countersunkM.append([countersunkM3width,countersunkM3depth])
    countersunkM4width = 0 if mode== "3DPR" else 0
    countersunkM4depth = 0 if mode== "3DPR" else 0
    countersunkM.append([countersunkM4width,countersunkM4depth])
    countersunkM5width = 0 if mode== "3DPR" else 0
    countersunkM5depth = 0 if mode== "3DPR" else 0
    countersunkM.append([countersunkM5width,countersunkM5depth])
    countersunkM6width = 0 if mode== "3DPR" else 0
    countersunkM6depth = 0 if mode== "3DPR" else 0
    countersunkM.append([countersunkM6width,countersunkM6depth])
    ######  Holes
    global holeM, holeM1, holeM2, holeM3, holeM4, holeM5, holeM6, holeM7, holeM8
    for x in range(1,20):
        d["HOLES"]["M" + str(x)] = x/2
    if mode == "3DPR":
        holes = [1.2,2.3,3.4,4.4,5.4,6.5,7.5,8.6,9.6,10.6,11.7,12.7,13.8,14.8,15.9,16.9,18,19,20.1,21.1]
        for x in range(1,20):
            d["HOLES"]["M" + str(x)] = holes[x] / 2    
    holeM = []
    holeM1 = 1.2/2 if mode== "3DPR" else 1/2
    holeM2 = 2.3/2 if mode== "3DPR" else 2/2
    holeM3 = 3.4/2 if mode== "3DPR" else 3/2
    holeM4 = 4.4/2 if mode== "3DPR" else 4/2
    holeM5 = 5.4/2 if mode== "3DPR" else 5/2
    holeM6 = 6.5/2 if mode== "3DPR" else 6/2
    holeM7 = 7.5/2 if mode== "3DPR" else 7/2
    holeM8 = 8.6/2 if mode== "3DPR" else 8/2
    holeM.append(0)
    holeM.append(holeM1)
    holeM.append(holeM2)
    holeM.append(holeM3)
    holeM.append(holeM4)
    holeM.append(holeM5)
    holeM.append(holeM6)
    holeM.append(holeM7)
    holeM.append(holeM8)
    #####  Nuts
    d["NUTS"]["M3"] = {
                    "WIDTH" : 5.5,
                    "MAJORWIDTH" : (5.5 * 1.154),
                    "DEPTH" : 2.4
                    }
    d["NUTS"]["M6"] = {
                    "WIDTH" : 10,
                    "MAJORWIDTH" : (10 * 1.154),
                    "DEPTH" : 5
                    }
    if mode == "3DPR":
        d["NUTS"]["M6"]["WIDTH"] = 11                 
        d["NUTS"]["M6"]["MAJORWIDTH"] = (11 * 1.154)
        d["NUTS"]["M6"]["DEPTH"] = 5.5

    global nutM, nutM1width, nutM1depth, nutM2width, nutM2depth, nutM3width, nutM3depth, nutM4width, nutM4depth, nutM5width, nutM5depth, nutM6width, nutM6depth
    nutM = []
    nutM.append([0,0]) 
    #M1 Nut
    nutM1width = 0
    nutM1depth = 0
    nutM.append([nutM1width,nutM1depth])    
    #M2 Nut
    nutM2width = 0
    nutM2depth = 0
    nutM.append([nutM2width,nutM2depth])    
    #M3 Nut
    #nutM3width = 6.05 if mode== "3DPR" else 5.5
    nutM3width = 6.05 * 1.154 if mode== "3DPR" else 5.5 * 1.154
    nutM3depth = 2.5 if mode== "3DPR" else 2.5
    nutM.append([nutM3width,nutM3depth])    
    #M4 Nut
    nutM4width = 0
    nutM4depth = 0
    nutM.append([nutM4width,nutM4depth])    
    #M5 Nut
    nutM5width = 0
    nutM5depth = 0
    nutM.append([nutM5width,nutM5depth])    
    #M6 Nut
    nutM6width = 11 if mode== "3DPR" else 10
    nutM6depth = 5 if mode== "3DPR" else 5
    nutM.append([nutM6width,nutM6depth])    

    ######  Plastic Rivets
    d["PLASTICRIVET"]["M2"] = {}
    d["PLASTICRIVET"]["M2"]["OD"]     = 4.2/2
    d["PLASTICRIVET"]["M2"]["DEPTH"]  = 1.2
    d["PLASTICRIVET"]["M2.7"] = {}
    d["PLASTICRIVET"]["M2.7"]["OD"]     = 5/2
    d["PLASTICRIVET"]["M2.7"]["DEPTH"]  = 1.4
    d["PLASTICRIVET"]["M3"] = {}
    d["PLASTICRIVET"]["M3"]["OD"]     = 6.4/2
    d["PLASTICRIVET"]["M3"]["DEPTH"]  = 1.6

    if mode == "3DPR":
        for t in d["PLASTICRIVET"]:
                d["PLASTICRIVET"][t]["OD"] = d["PLASTICRIVET"][t]["OD"] + 1/2
                d["PLASTICRIVET"][t]["DEPTH"] = d["PLASTICRIVET"][t]["DEPTH"] + 0.5

    ######  SocketCap
    d["SOCKETCAPS"]["M3"] = {}
    d["SOCKETCAPS"]["M3"]["RAD"] = 5.5/2
    d["SOCKETCAPS"]["M3"]["DEPTH"] = 2.5
    d["SOCKETCAPS"]["M4"] = {}
    d["SOCKETCAPS"]["M4"]["RAD"] = 7/2
    d["SOCKETCAPS"]["M4"]["DEPTH"] = 3
    d["SOCKETCAPS"]["M5"] = {}
    d["SOCKETCAPS"]["M5"]["RAD"] = 8.5/2
    d["SOCKETCAPS"]["M5"]["DEPTH"] = 3
    d["SOCKETCAPS"]["M6"] = {}
    d["SOCKETCAPS"]["M6"]["RAD"] = 10/2
    d["SOCKETCAPS"]["M6"]["DEPTH"] = 5

    for t in d["SOCKETCAPS"]:
        d["SOCKETCAPS"][t]["RAD"] = d["SOCKETCAPS"][t]["RAD"] + 0.3
        d["SOCKETCAPS"][t]["DEPTH"] = d["SOCKETCAPS"][t]["DEPTH"] + 0.5


    ######  OOEB
    global ooebPinWidth,  ooebPinWidthWide

    ooebPinWidth = 0.6
    if(mode=="3DPR" or mode=="LAZE"):
        ooebPinWidth = 0.6 + 0.6
    ooebPinWidthWide = 1.2
    if(mode=="3DPR" or mode=="LAZE"):
        ooebPinWidthWide = 1.2 + 0.6



changeMode()


""""    
holeM12D = s=="3DPR" ? 1.4/2 : 1.2/2;
holeM16D = s=="3DPR" ? 1.8/2 : 1.6/2;
holeM2 = s=="3DPR" ? 2.3/2 : 2/2;
holeM25D = s=="3DPR" ? 2.8/2 : 2.5/2;
holeM27D = s=="3DPR" ? 3.1/2 : 2.7/2;    
holeM3 = s=="3DPR" ? 3.4/2 : 3/2;
holeM35D = s=="3DPR" ? 3.9/2 : 35/2;
holeM4 = s=="3DPR" ? 4.4/2 : 4/2;
holeM5 = s=="3DPR" ? 5.4/2 : 5/2;
holeM6 = s=="3DPR" ? 6.5/2 : 6/2;
holeM6Minus = s=="3DPR" ? 5.8/2 : 5.9/2;
holeM7 = s=="3DPR" ? 7.5/2 : 7/2;
holeM8 = s=="3DPR" ? 8.6/2 : 8/2;
holeM9 = s=="3DPR" ? 9.6/2 : 9/2;
holeM10 = s=="3DPR" ? 10.6/2 : 10/2;
holeM11 = s=="3DPR" ? 11.6/2 : 11/2;
holeM12 = s=="3DPR" ? 12.6/2 : 12/2;
holeM13 = s=="3DPR" ? 13.6/2 : 13/2;
holeM14 = s=="3DPR" ? 14.6/2 : 14/2;
holeM15 = s=="3DPR" ? 15.6/2 : 15/2;
holeM16 = s=="3DPR" ? 16.6/2 : 16/2;
holeM17 = s=="3DPR" ? 17.6/2 : 17/2;
holeM18 = s=="3DPR" ? 18.6/2 : 18/2;
holeM19 = s=="3DPR" ? 19.6/2 : 19/2;
holeM20 = s=="3DPR" ? 20.6/2 : 20/2;
"""

##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################
######  REGULAR STUFF
##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################
##################################################################################################################################################


def setMode(mode="3DPR"):
    changeMode(mode)

def getMode():
    return mode



def saveToScad(fileName, parts):
    dir =  os.path.dirname(os.path.abspath(fileName))
    Path(dir).mkdir(parents=True, exist_ok=True)
    file_out = scad_render_to_file(parts, fileName, include_orig_code=False,file_header=f'$fn = 48;')


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
    
def saveToSvg(fileIn, fileOut=""):
    if fileOut == "":
        fileOut = fileIn.replace(".scad",".svg")
    saveToFile(fileIn, fileOut)

def saveToFile(fileIn, fileOut,extra=""):
    extra = extra + " --colorscheme Tomorrow"

    launchStr = 'openscad -o "' + fileOut + '"' + extra + ' "' + fileIn + '"'
    if ".png" in fileOut:
        launchStr = launchStr + " --render"
    print("            saveToFile launch string: " + launchStr)
    subprocess.run(launchStr)
    x=0



def insert(item="",pos=[None,None,None],x=0,y=0,z=0,ex=0,size=[None,None,None],length=0,rot=[None,None,None],rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color=colDefault,alpha=1,OOwidth=0,OOheight=0,holes=True,negative=True, name="",m="",dict=None):
    return OPSCInsert(item,pos,x,y,z,ex,size,length,rot,rotX,rotY,rotZ,width,height,depth,rad,rad2,color,alpha,OOwidth,OOheight,holes,negative,name,m=m,dict=dict)


def OPSCInsert(item="",pos=[None,None,None],x=0,y=0,z=0,ex=0,size=[None,None,None],length=0,rot=[None,None,None],rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,col=colDefault,alpha=1,OOwidth=0,OOheight=0,holes=True,negative=True, name="",m="",dict=None):
    if dict != None:
        try:
            item = dict["TYPE"]
        except:
            pass
        try:
            x = dict["X"]
        except:
            pass
        try:
            y = dict["Y"]
        except:
            pass
        try:
            z = dict["Z"]
        except:
            pass
        try:
            ex = dict["EX"]
        except:
            pass
        try:
            length = dict["LENGTH"]
        except:
            pass
        try:
            rotX = dict["ROTX"]
        except:
            pass
        try:
            rotY = dict["ROTY"]
        except:
            pass
        try:
            rotZ = dict["ROTZ"]
        except:
            pass
        try:
            width = dict["WIDTH"]
        except:
            pass
        try:
            height = dict["HEIGHT"]
        except:
            pass
        try:
            depth = dict["DEPTH"]
        except:
            pass
        try:
            rad = dict["RAD"]
        except:
            pass
        try:
            rad2 = dict["RAD2"]
        except:
            pass
        try:
            col = dict["COLOR"]
        except:
            pass
        try:
            alpha = dict["ALPHA"]
        except:
            pass
        try:
            OOwidth = dict["OOWIDTH"]
        except:
            pass
        try:
            OOheight = dict["OOHEIGHT"]
        except:
            pass
        try:
            holes = dict["HOLES"]
        except:
            pass
        try:
            negative = dict["NEGATIVE"]
        except:
            pass
        try:
            name = dict["NAME"]
        except:
            pass
        try:
            m = dict["M"]
        except:
            pass    
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
                                OPSCInsertIf(item,pos,x,y,z,ex,size,length,rot,rotX,rotY,rotZ,width,height,depth,rad,rad2,col,alpha,OOwidth,OOheight,holes,negative,name,m=m,dict=dict)
                            )
                        ))
                
    

    return returnValue

def OPSCInsertIf(item="",pos=[None,None,None],x=0,y=0,z=0,ex=0,size=[None,None,None],length=0,rot=[None,None,None],rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color=colDefault,alpha=1,OOwidth=0,OOheight=0,holes=True,negative=True, name="",m="",dict=None):
    returnValue = cube([10,10,10])

    if size[0] != None:
        width=size[0]
        height=size[1]
        depth=size[2]

    #print("    OPSCInsert item:" + str(item) + " at:[" + str(x) + "," + str(y) + "," + str(z) + "] size: [" + str(width) + "," + str(height) + "," + str(depth) + "]")

    if(item=="cube"):
        returnValue =  translate([0,0,-depth/2])(cube([width,height,depth],center=True).set_modifier(m))
    elif(item=="cylinder"):        
        returnValue = translate([0,0,-depth/2])(cylinder(r=rad,h=depth,center=True).set_modifier(m))
    elif(item=="sphere"):        
        returnValue = translate([0,0,-rad])(sphere(r=rad).set_modifier(m))
    elif(item=="plane"):
        if depth == 100:
            returnValue = insert("cube",size=[1000,1000,0.1],color=color).set_modifier(m)            
        else:
            returnValue = insert("cube",size=[1000,1000,depth],color=color).set_modifier(m)                        
    elif(item=="cubeRounded"):
        if(rad == 0):
                            rad = 5
        returnValue =  translate([0,0,-depth])(
                        linear_extrude(height=depth)(                        
                            offset(r=rad)(
                                square((width-rad*2+.01,height-rad*2+.01),center=True).set_modifier(m)
                                )
                            )
        )
    ######  Bearing
    elif("bearing" in item.lower()):
        size = item.replace("bearing","")    
        #m="#"
        if size == "606":
            rad = d["BEARINGS"][size]["OUTSIDE"]
            depth = d["BEARINGS"][size]["DEPTH"]
            bearingFull = insert("cylinder",rad=rad,depth=depth,z=depth/2,m=m)
            rad = d["BEARINGS"][size]["OUTSIDELITTLE"]
            if rad2 == 0:
                depth = 100
            else:
                depth = rad2
            outsideLittle = insert("cylinder",rad=rad,depth=depth,z=depth/2,m=m)
            if ex.upper() == "SOLID":
                returnValue = bearingFull + outsideLittle
            else:
                returnValue = bearingFull + outsideLittle
        else:
            rad = d["BEARINGS"][size]["OUTSIDE"]
            depth = d["BEARINGS"][size]["DEPTH"]
            bearingFull = insert("cylinder",rad=rad,depth=depth,z=depth/2,m=m)
            rad = d["BEARINGS"][size]["INSIDE"]
            depth = d["BEARINGS"][size]["DEPTH"]
            bearingInside = insert("cylinder",rad=rad,depth=depth,z=depth/2,m=m)
            rad = d["BEARINGS"][size]["OUTSIDELITTLE"]
            if rad2 == 0:
                depth = 100
            else:
                depth = rad2
            outsideLittle = insert("cylinder",rad=rad,depth=depth,z=depth/2,m=m)
            rad = d["BEARINGS"][size]["INSIDEBIG"]
            if rad2 == 0:
                depth = 100
            else:
                depth = rad2            
            insideBig = insert("cylinder",rad=rad,depth=depth,z=depth/2,m=m)
            if ex == "SOLID":
                returnValue = bearingFull + outsideLittle
            else:
                outside = difference()(outsideLittle,insideBig)
                inside = difference()(bearingFull,bearingInside)
                returnValue = outside + inside
    ######  Countersunk
    elif(item == "countersunkM1" or item == "csM1" ):
        returnValue = OSPCgetCountersunk(rad=1,m=m)
    elif(item == "countersunkM2" or item == "csM2" ):
        returnValue = OSPCgetCountersunk(rad=2,m=m)
    elif(item == "countersunkM3" or item == "csM3" ):
        returnValue = OSPCgetCountersunk(rad=3,m=m)
    elif(item == "countersunkM4" or item == "csM4" ):
        returnValue = OSPCgetCountersunk(rad=4,m=m)
    elif(item == "countersunkM5" or item == "csM5" ):
        returnValue = OSPCgetCountersunk(rad=5,m=m)
    elif(item == "countersunkM6" or item == "csM6" ):
        returnValue = OSPCgetCountersunk(rad=6,m=m)
    elif(item == "countersunk" or item == "cs"):
        returnValue = OSPCgetCountersunk(rad=rad,m=m)

    ######  Hole Slotted
    elif "holeslotted" in item.lower():
        size = item.upper().replace("HOLESLOTTED","")
        returnValue = OSPCgetHoleSlotted(size=size,depth=depth,ex=ex,m=m)
    ######  Holes    
    elif("hole" in item.lower()):
        size = size = item.upper().replace("HOLE","")
        returnValue = OSPCgetHole(size=size,depth=depth,m=m)

    
    ######  Nuts
    elif(item == "nutM1"):
        returnValue = OSPCgetNut(rad=1,depth=depth,extra=ex,m=m)
    elif(item == "nutM2"):
        returnValue = OSPCgetNut(rad=2,depth=depth,extra=ex,m=m)
    elif(item == "nutM3"):
        returnValue = OSPCgetNut(rad=3,depth=depth,extra=ex,m=m)
    elif(item == "nutM4"):
        returnValue = OSPCgetNut(rad=4,depth=depth,extra=ex,m=m)
    elif(item == "nutM5"):
        returnValue = OSPCgetNut(rad=5,depth=depth,extra=ex,m=m)
    elif(item == "nutM6"):
        returnValue = OSPCgetNut(rad=6,depth=depth,extra=ex,m=m)
    elif(item == "nut"):
        returnValue = OSPCgetNut(rad=rad,depth=depth,extra=ex,m=m)
    
    ###### NutSideInsert
    elif "nutsideinsert" in item.lower():
        size = item.lower().replace("nutsideinsert","").upper()
        returnValue = OSPCgetNutSideInsert(size=size,depth=depth,extra=ex,m=m)

    elif("plasticrivet" in item.lower()):
        size = item.upper().replace("PLASTICRIVET","")
        rad = d["PLASTICRIVET"][size]["OD"]
        dd = d["PLASTICRIVET"][size]["DEPTH"]
        returnValue = insert("cylinder",z=0,rad=rad,depth=dd,m=m)

    ######  Rounded Clearance
    elif(item.lower() =="roundedclearance"):
        if rad == 0:
            rad = 12/2
        returnValue = OSPCgetRoundedClearance(rad=rad,depth=depth,m=m)

    ######  Socket Caps
    elif("socketcap" in item.lower()):
        size = item.upper().replace("SOCKETCAP","")
        if depth == 0 or depth == 100:
            dd = d["SOCKETCAPS"][size]["DEPTH"]
        else:
            dd = depth
        returnValue = insert("cylinder",z=0,rad=d["SOCKETCAPS"][size]["RAD"],depth=dd,m=m)
    

    return returnValue    
                

def OSPCgetHole(size,depth=0,m=""):
    if "M" in size:
        rad =  d["HOLES"][size]
    else:
        rad = float(size)/2
    if depth == 0 or depth == 100:
        return translate([0,0,-250])(cylinder(r=rad,h=500).set_modifier(m))
    else:    
        return cylinder(r=rad,h=depth).set_modifier(m)

def OSPCgetHoleSlotted(size,depth=0,ex="",m=""):    
    slotSize = 0
    if ex == "":
        slotSize = 10
    else:
        slotSize = ex

    rv =   hull()(insert("hole"+size,x=slotSize/2,depth=depth),insert("hole"+size,x=-slotSize/2,depth=depth)).set_modifier(m)    
    return rv
    

def OSPCgetHoleRad(rad,depth=0,m=""):
    return translate([0,0,-250])(cylinder(r=rad,h=500).set_modifier(m))

def OSPCgetNut(rad,depth,extra=0,m=""):
    depth = d["NUTS"]["M" + str(rad)]["DEPTH"] if depth==100 else depth
    returnValue = OPSChexagon(nutM[rad][NUTWIDTH]+extra,depth=depth+extra,m=m)
    return returnValue

def OSPCgetNutSideInsert(size,depth="",extra="",m=""):
    depth = d["NUTS"][size]["DEPTH"] if (depth==100 or depth == 0) else depth
    returnValue = OPSChexagon(d["NUTS"][size]["MAJORWIDTH"]+extra,depth=depth+extra,m=m)
    widthPlus = d["NUTS"][size]["WIDTH"] * 2
    w = d["NUTS"][size]["WIDTH"] + extra
    h = widthPlus
    dd = depth
    returnValue = returnValue + insert("cube",pos=[0,widthPlus/2,0],size=[w,h,dd],m=m)
    return returnValue


def OSPCgetCountersunk(rad,m=""):
    depth=countersunkM[rad][DEPTH]
    returnValue = translate([0,0,-depth])(cylinder(h=depth,r2=countersunkM[rad][WIDTH],r1=holeM[rad])).set_modifier(m)
    return returnValue

def OSPCgetRoundedClearance(rad,depth,stretch=15,m=""):
    hole1 = insert("cylinder",rad=rad,x=0,y=0,depth=depth) 
    hole2 = insert("cylinder",rad=rad,x=0,y=-stretch,depth=depth) 
    hole3 = insert("cylinder",rad=rad,x=-stretch,y=0,depth=depth) 
    hole4 = insert("cylinder",rad=rad,x=-stretch,y=-stretch,depth=depth)     
    return hull()(hole1,hole2,hole3,hole4).set_modifier(m)


def OPSChexagon(width,depth,m=""):
    angles = []
    for a in range(0,6):
        angles.append((a*360/6)+30)
    points = []
    for angle in angles:
        x = math.cos((math.pi/180)*angle)*(width/2)
        y = math.sin((math.pi/180)*angle)*(width/2)
        points.append([x,y])

        rv = polygon(points)
        rv = linear_extrude(height=depth)(rv)
        rv = translate([0,0,-depth])(rv)
        rv = rv.set_modifier(m)

    return rv

def OPSChexagonOld(width,depth,m=""):
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
    ).set_modifier(m)

    return returnValue

class item:

    def __init__(self):
        self.posItems=list()
        self.negItems=list()

    def isEmpty(self):        
        testString = scad_render(self.getPart())
        #print("test String length: " + str(len(testString)))
        returnValue = False
        if len(testString) == 270:            
            returnValue = True
        return returnValue

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

    def getSplit(self,start=0,depth=6,tileDif=200,z=0,rotX=0,rotY=0,rotZ=0):
        rv= []

        rv.append(translate([0,0,0])(
            intersection()(
                insert("cube",size=[1000,1000,depth],z=start),
                self.getPart()
            )
        )
        )

        rv.append(translate([0,0,depth+z])(rotate([180,0,0])(translate([0,tileDif,depth])(
            intersection()(
                insert("cube",size=[1000,1000,depth],z=start-depth),
                self.getPart()
            )
        )
        )
        )
        )        
        return rotate([rotX,rotY,rotZ])(union()(rv))


######################  OOBB STUFF
obs = 15
def getOOBBCoord(x,wid):
    x = x-1
    fullWidth = wid * obs
    rv = (-fullWidth/2 + obs/2) + (x*obs)
    return rv