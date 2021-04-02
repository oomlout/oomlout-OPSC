
//#########################################################################################
//#########################################################################################
//#########          INSERT ROUTINES


module oi(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=0,rad=0,color="gray",alpha=1){
    OPSCInsert(item,x,y,z,ex,length,rotX,rotY,rotZ,width,height,depth,rad,color,alpha);
}

module OPSCInsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=0,rad=0,color="gray",alpha=1){
    color(color,alpha){
        translate([x,y,z]){
                rotate([rotX,rotY,rotZ]){
                    //////////////////    PRIMATIVES
                    if(item=="cylinder"){
                        OPSCCylinder(rad=rad,depth=depth);
                    } 
                    if(item=="cube"){
                        OPSCCube(width=width,height=height,depth=depth);
                    } 
                    if(item=="cubeRounded"){
                        OPSCCubeRounded(width=width,height=height,depth=depth,rad=rad);
                    }                    
                    if(item=="hole"){
                        OPSCHole(rad);
                    }
                    if(item=="holeRect"){
                        OPSCHoleRect(width=width,height=height);
                    }                                    
                    //////////////////    OPSC
                    
                    if(item=="plateOOBB"){
                        OPSCInsert("cubeRounded",width=(width*15)-3,height=(height*15)-3,depth=depth);
                    }
                    if(item=="OPSCHole"){
                        rad=OPSCHole;
                        OPSCHole(rad);
                    }
                    if(item=="OPSCHoleSlot"){
                        union(){
                            hull(){
                                OPSCInsert("OPSCHole",x=-3);
                                OPSCInsert("OPSCHole",x=3);
                            }
                        }
                    }
                    //////////////////      HOLES
                    if(item=="holeM3"){
                           OPSCHole(holeM3);
                    }
                    if(item=="holeM4"){
                           OPSCHole(holeM4);
                    }
                    if(item=="holeM5"){
                           OPSCHole(holeM5);
                    }
                    if(item=="holeM6"){
                           OPSCHole(holeM6);
                    }
                    if(item=="holeM8"){
                           OPSCHole(holeM8);
                    }
                    if(item=="holeM10"){
                           OPSCHole(holeM10);
                    }
                    //////////////////      FASTENERS
                    
                    if(item=="socketHeadM3"){
                        oi("holeM3");
                        oi("cylinder",rad=socketHeadM3,depth=socketHeadM3Depth,z=socketHeadM3Depth);
                    }
                    //////////////////////  COUPLERS
                    if(item=="couplerFlangeM5"){
                        rotate([0,0,45]){
                            OPSCInsert("holeM3",0,8);
                            OPSCInsert("holeM3",0,-8);
                            OPSCInsert("holeM3",8,0);
                            OPSCInsert("holeM3",-8,0);
                            OPSCInsert("holeM6",0,0);
                        }
                    }
                    //////////////////    BEARINGS
                    
                    if(item=="bearing606"){
                            OPSCCylinder(bearing606Big,depth=6);
                            OPSCCylinder(bearing606Little);
                    }
                    if(item=="bearing608"){
                            OPSCCylinder(bearing608Big,depth=7);
                            OPSCHole(bearing608Little);
                    }
                    if(item=="Bearing6810"){
                            OPSCHole(OPSCBearing6810Outside,7,0);
                            OPSCHole(OPSCBearing6810Little,100,50);
                    }
                    
                    //////////////////    NUTS                    
                    
                    if(item=="M3SocketHeadFullNut"){
                        OPSCInsert("M3SocketHeadFull",0,0,0,length=height);
                        OPSCInsert("M3NutCaptiveSingle",0,0,z=-height+OPSCNutM3Height);
                        
                    }
                    if(item=="M3SocketHeadUpsideDown"){
                        top = OPSCm3SocketHeadHole;
                        bot = OPSCm3SocketHeadHole;
                        height = OPSCm3SocketHeadDepth;
                        OPSCCountersink3DComplete(0,0,top,bot,height,height);
                    }

                    if(item=="M3NutCaptive"){
                       OPSCPolygon3DComplete(6,0,0,OPSCNutM3Width/2,height,0);
                    }
                    if(item=="M3NutClearance"){  ///clearnce for an m3 nut
                        translate([0,0,-height]){
                            linear_extrude(height){
                                circle(6.2/2);
                            }
                        }
                    }
                    
                  
                  
              }
        }
    }   
}
