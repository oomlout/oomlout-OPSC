//######  OPSC OpenSCAD Generation  ######
//########################################

    //OPENSCAD Variables
    //$fn = 50;
    $fn = 25; //lower to speed up generation should use 50

    //CORE
    OPSCSpacing = 15;
    OS=OPSCSpacing;
    
    //Not yet implemented
    OPSCfirstLayerLipOffset = 0.35;
    OPSCfirstLayerLipDepth = 0.2;
    
    
    OOBBspacing = 15;

    // HOLES
    OPSCHole = s=="3DPR" ? 6.5/2 : 6/2;

    
    
    holeM1 = s=="3DPR" ? 1.2/2 : 1/2;
    holeM12D = s=="3DPR" ? 1.4/2 : 1.2/2;
    holeM16D = s=="3DPR" ? 1.8/2 : 1.6/2;
    holeM2 = s=="3DPR" ? 2.3/2 : 2/2;
    holeM3 = s=="3DPR" ? 3.4/2 : 3/2;
    holeM4 = s=="3DPR" ? 4.4/2 : 4/2;
    holeM5 = s=="3DPR" ? 5.4/2 : 5/2;
    holeM6 = s=="3DPR" ? 6.5/2 : 6/2;
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
    
    //  FASTENERS
    socketHeadM3 = s=="3DPR" ? 5.5/2 + 0.6 : 5.5/2;
    socketHeadM3Depth = s=="3DPR" ? 3 + 0.8 : 3;

    countersunkM3Top = s=="3DPR" ? 5.5/2+0.6 : 5.5/2;    
    countersunkM3Depth = s=="3DPR" ? 1.7+0.2 : 1.7;    

    // Bearings
        //606
    bearing606Big = s=="3DPR" ? 17.5/2 : 17/2;
    bearing606Little = s=="3DPR" ? 14.5/2 : 14/2;
    bearing606Depth = 6;

        //608
    bearing608Big = s=="3DPR" ? 22.5/2 : 22/2;
    bearing608Little = s=="3DPR" ? 19.5/2 : 19/2;
    bearing608Depth = 7;
    
    //6810 Bearing
    OPSCBearing6810Inside = s=="3DPR" ? (50/2-(0.15/2)) : 50/2;
    OPSCBearing6810Outside = s=="3DPR" ? 65/2-(0.2/2) : 65/2;
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
    OPSCNutM6Width = s=="3DPR" ? 12.7 : 11.547;
    
    OPSCNutM6WidthShort = s=="3DPR" ? 11 : 10;
    
    OPSCNutM6Height = s=="3DPR" ? 5 : 5; //actually 4.85 extra for clearance
    
    //Tripod
    OSPCNutTripodWidth = s=="3DPR" ? 14 : 12.8;
    
    OSPCNutTripodHeight = s=="3DPR" ? 5.2 : 5.2
    
    
    
    