

mode = "3DPR"
#mode = "LAZE"
#mode = "TURE"
#mode = ""


######  Countersunk
countersunkM = []
WIDTH = 0
DEPTH = 1
countersunkM1width = 0
countersunkM1depth = 0
countersunkM2width = 0
countersunkM2depth = 0
countersunkM3width = 0
countersunkM3depth = 0
countersunkM4width = 0
countersunkM4depth = 0
countersunkM5width = 0
countersunkM5depth = 0
countersunkM6width = 0
countersunkM6depth = 0

######  Holes
holeM = []
holeM1 = 0
holeM2 = 0
holeM3 = 0
holeM4 = 0
holeM5 = 0
holeM6 = 0

######  Nuts
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

######  OOEB
ooebPinWidth = 0


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
    nutM3width = 6.05 if mode== "3DPR" else 5.5
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

    ######  OOEB
    global ooebPinWidth

    ooebPinWidth = 0.6
    if(mode=="3DPR" or mode=="LAZE"):
        ooebPinWidth = 0.6 + 0.6


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