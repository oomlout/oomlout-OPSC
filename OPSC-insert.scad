
//#########################################################################################
//#########################################################################################
//#########          INSERT ROUTINES


module oi(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    OPSCInsert(item,x,y,z,ex,length,rotX,rotY,rotZ,width,height,depth,rad,color,alpha,OOwidth,OOheight,holes,negative);
}

module OPSCInsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    color(color,alpha){
        translate([x,y,z]){
                rotate([rotX,rotY,rotZ]){
                    //////////////////    PRIMATIVES
                    
                    if(item=="cylinder"){
                        OPSCCylinder(rad=rad,depth=depth);
                    }
                    if(item=="sphere"){
                        OPSCSphere(rad=rad);
                    } 
                    if(item=="cube" || item=="rect" || item=="rectangle"){
                        OPSCCube(width=width,height=height,depth=depth);
                    } 
                    if(item=="cubeRounded" || item=="rectRounded" || item=="rectangleRounded"){
                        OPSCCubeRounded(width=width,height=height,depth=depth,rad=rad);
                    } 
                    if(item=="oobbBase"){
                        OPSCCubeRounded(width=(width*15)-3,height=(height*15)-3,depth=depth,rad=rad);
                    } 
                    if(item=="oobbHole"){
                        OPSCInsert("hole",rad=holeM6,x=-(OOwidth*15/2)+((width-1)*15)+15/2,y=-(OOheight*15/2)+((height-1)*15)+15/2);
                    } 
                    if(item=="oobbHoleClearance"){
                        OPSCInsert("hole",rad=12/2,x=((width-1)*15)+15/2,y=((height-1)*15)+15/2);
                    }                    
                    if(item=="hole"){
                        OPSCHole(rad);
                    }
                    if(item=="holeRect"){
                        OPSCHoleRect(width=width,height=height);
                    }                                    
                    //////////////////    OOBB
                    if(item=="oobb"){
                        OPSCoobbBase(OOwidth,OOheight,holes=holes,depth=depth,color=color);
                    }
                    if(item=="oobbSlot"){
                        oi("cube",width=3,height=6,depth=100,z=50);
                    }
                    if(item=="oobbBoltHole" || item=="oobbBoltSocket" ){
                        oi("holeM6");
                        oi("oobbSlot",x=0,y=15);
                        oi("oobbSlot",x=0,y=-15);
                    }
                    if(item=="oobbBoltPlug"){
                        echo(negative);
                        if(negative){
                            dep = 10;
                            //bolt hole
                            oi("cube",x=1.5,y=0,width=13,height=6,depth=depth);
                            //nut hole
                            oi("cube",x=5,y=0,width=6,height=10,depth=depth);                                
                        }else{
                            oi("cube",x=0,y=15,width=3,height=6,depth=depth);
                            oi("cube",x=0,y=-15,width=3,height=6,depth=depth);                           
                        }
                    }
                    
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
                    if(item=="holeM1"){OPSCHole(holeM1);}
                    if(item=="holeM2"){OPSCHole(holeM2);}
                    if(item=="holeM3"){OPSCHole(holeM3);}
                    if(item=="holeM4"){OPSCHole(holeM4);}
                    if(item=="holeM5"){OPSCHole(holeM5);}
                    if(item=="holeM6"){OPSCHole(holeM6);}
                    if(item=="holeM7"){OPSCHole(holeM7);}
                    if(item=="holeM8"){OPSCHole(holeM8);}
                    if(item=="holeM9"){OPSCHole(holeM9);}
                    if(item=="holeM10"){OPSCHole(holeM10);}
                    if(item=="holeM11"){OPSCHole(holeM11);}
                    if(item=="holeM12"){OPSCHole(holeM12);}
                    if(item=="holeM13"){OPSCHole(holeM13);}
                    if(item=="holeM14"){OPSCHole(holeM14);}
                    if(item=="holeM15"){OPSCHole(holeM15);}
                    if(item=="holeM16"){OPSCHole(holeM16);}
                    if(item=="holeM17"){OPSCHole(holeM17);}
                    if(item=="holeM18"){OPSCHole(holeM18);}
                    if(item=="holeM19"){OPSCHole(holeM19);}
                    if(item=="holeM20"){OPSCHole(holeM20);}
                    
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
