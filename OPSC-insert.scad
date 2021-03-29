
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
                    if(item=="M3SocketHeadTop"){ //Just the top
                        depth=OPSCm3SocketHeadDepth;
                        OPSCCylinder(rad=OPSCm3SocketHeadHole,depth=OPSCm3SocketHeadDepth);
                    }
                    if(item=="M3SocketHeadFull"){
                        union(){
                            OPSCInsert("M3SocketHeadTop",z=OPSCm3SocketHeadDepth);
                            OPSCInsert("M3Hole");
                        }
                    }
                    if(item=="M3SocketHead"){
                        union(){
                            OPSCInsert("M3SocketHeadTop",z=OPSCm3SocketHeadDepth);
                            OPSCCylinder(rad=M3hole,height=length);
                        }
                    }
                    //////////////////////  COUPLERS
                    if(item=="CouplerFlangeM5"){
                        rotate([0,0,45]){
                            OPSCInsert("M3Hole",0,8);
                            OPSCInsert("M3Hole",0,-8);
                            OPSCInsert("M3Hole",8,0);
                            OPSCInsert("M3Hole",-8,0);
                            OPSCInsert("M6Hole",0,0);
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

                    if(item=="M3HoleFull"){
                           rad=OPSCm3Hole;
                           OPSCHole3D(rad);
                    }
                    if(item=="M2Hole"){
                           height=50;    
                           z=height-10;
                           rad=OPSCm2Hole;
                           OPSCHole(rad,height,z);

                    }
                    if(item=="M3HoleExtra"){    
                           z=ooZ;
                           rad=OPSCm3Hole;
                           OPSCHole(rad,height,0);

                    }
                    if(item=="M3HoleScrewTop"){
                           height=50;    
                           z=height-10;
                           rad=OPSCm3SocketHeadHole;
                           OPSCHole(rad,height,z);

                    }
                    
                    if(item=="M3Slot"){
                           height=50;    
                           z=height-10;
                           rad=OPSCm3Hole;
                           slotw = 6;
                           holeRadius = OPSCm3Hole;
                           //slot
                        translate([0,0,-10]){
                            linear_extrude(height){
                                translate([-slotw/2+holeRadius,0,0]){
                                    
                                    translate([0,0,0]){
                                        circle(holeRadius);
                                    }
                                    translate([slotw-holeRadius*2,0,0]){
                                        circle(holeRadius);
                                    }
                                    translate([slotw/2-holeRadius,0,0]){
                                        square([slotw-holeRadius*2,holeRadius*2],true);
                                    }
                                }
                            }
                        }
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
