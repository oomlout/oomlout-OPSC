//######  OPSC OpenSCAD Generation  ######
//########################################

    //OPENSCAD Variables
    $fn = 50;
    //$fn = 25; //lower to speed up generation should use 50

    //CORE
    OPSCSpacing = 15;
    OS=OPSCSpacing;
    
    //Not yet implemented
    OPSCfirstLayerLipOffset = 0.35;
    OPSCfirstLayerLipDepth = 0.2;

    // HOLES
    OPSCHole = s=="3DPR" ? 6.5/2 : 6/2;

    holeM3 = s=="3DPR" ? 3.4/2 : 3/2;
    holeM4 = s=="3DPR" ? 4.4/2 : 4/2;
    holeM5 = s=="3DPR" ? 5.4/2 : 5/2;
    holeM6 = s=="3DPR" ? 6.5/2 : 6/2;
    holeM8 = s=="3DPR" ? 8.6/2 : 8/2;
    holeM10 = s=="3DPR" ? 10.6/2 : 10/2;
    

    // Bearings
    OPSCBearing606Big = s=="3DPR" ? 17.5/2 : 17/2;
    OPSCBearing606Little = s=="3DPR" ? 14.5/2 : 14/2;

    //6810 Bearing
    OPSCBearing6810Inside = s=="3DPR" ? (50/2-(0.15/2)) : 50/2;
    OPSCBearing6810Outside = s=="3DPR" ? 65/2-(0.2/2) : 65/2;

    OPSCBearing6810OutsideHoldTrue = OPSCBearing6810OutsideTrue;
    OPSCBearing6810OutsideHold3D  = (OPSCBearing6810OutsideHoldTrue+(0.6/2)); //0.45 almost large enough going to 0.6 for safetuy margin)
    OPSCBearing6810OutsideHold = s=="3DPR" ? 65/2+(0.6/2) : 65/2;

    OPSCBearing6810Little = 65/2-(3/2);
    OPSCBearing6810LittleInside =50/2+(3/2);

    // NUTS
        //M3
    OPSCNutM3WidthTrue = 6.351;    //5.5mm short side
    OPSCNutM3Width3D = 7.028; //needs to be the long side 
    OPSCNutM3Width = s=="3DPR" ? OPSCNutM3Width3D : OPSCNutM3WidthTrue;
    
    OPSCNutM3WidthShortSideTrue = 5.5;    //5.5mm short side
    OPSCNutM3WidthShortSide3D = 6; //needs to be the long side // //6mm short side    
    OPSCNutM3WidthShortSide = s=="3DPR" ? OPSCNutM3WidthShortSide3D : OPSCNutM3WidthShortSideTrue;
    
    OPSCNutM3HeightTrue = 2.5;    //actually 4.85 extra for clearance
    OPSCNutM3Height3D = 2.5;    
    OPSCNutM3Height = s=="3DPR" ? OPSCNutM3Height3D : OPSCNutM3HeightTrue;
    
        //M6
    OPSCNutM6WidthTrue = 11.547;    //short side 10
    OPSCNutM6Width3D = 12.7; //needs to be the long side (short side is   
    OPSCNutM6Width = s=="3DPR" ? OPSCNutM6Width3D : OPSCNutM6WidthTrue;
    
    OPSCNutM6WidthShortTrue = 10;    
    OPSCNutM6WidthShort3D = 11; //needs to be the long side    
    #OPSCNutM6WidthShort = s=="3DPR" ? OPSCNutM6WidthShort3D : OPSCNutM6WidthShortTrue;
    
    
    OPSCNutM6HeightTrue = 5;    //actually 4.85 extra for clearance
    OPSCNutM6Height3D = 5;    
    OPSCNutM6Height = s=="3DPR" ? OPSCNutM6Height3D : OPSCNutM6HeightTrue;
    
    
    
    // TABS
    
    OPSCTabWidthTrue = 3;
    OPSCTabWidth3D = 2.7;
    OPSCTabWidthLaser = 3;
    OPSCTabWidth = s=="3DPR" ? OPSCTabWidth3D : OPSCTabWidthTrue;
    
    OPSCTabWidthHoleTrue = 3;
    OPSCTabWidthHole3D = 3.4;
    OPSCTabWidthHoleLaser = 3;
    OPSCTabWidthHole = s=="3DPR" ? OPSCTabWidthHole3D : OPSCTabWidthHoleTrue;
    
    OPSCTabHeightTrue = OPSCTabWidthTrue;
    OPSCTabHeight3D = OPSCTabWidth3D;
    OPSCTabHeightLaser = OPSCTabWidthLaser;
    OPSCTabHeight = s=="3DPR" ? OPSCTabHeight3D : OPSCTabHeightTrue;
    
    OPSCTabHeightHoleTrue = OPSCTabWidthHoleTrue;
    OPSCTabHeightHole3D = OPSCTabWidthHole3D;
    OPSCTabHeightHoleLaser = OPSCTabWidthHoleLaser;
    OPSCTabHeightHole = s=="3DPR" ? OPSCTabHeightHole3D : OPSCTabHeightHoleTrue;

