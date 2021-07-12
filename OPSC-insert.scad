
//#########################################################################################
//#########################################################################################
//#########          INSERT ROUTINES
 include <TAXA-insert.scad>;


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
                    else if(item=="sphere"){
                        OPSCSphere(rad=rad);
                    } 
                    else if(item=="cube" || item=="rect" || item=="rectangle"){
                        OPSCCube(width=width,height=height,depth=depth);
                    }
                    else if(item=="triangle"){
                        OPSCTriangle(width=width,height=height,depth=depth,ex=ex);
                        }  
                    else if(item=="cubeClearance"){
                        OPSCCube(width=width,height=height,depth=depth);    
                        oi("hole",x=width/2,y=height/2,depth=depth,rad=rad);
                        oi("hole",x=width/2,y=-height/2,depth=depth,rad=rad);
                        oi("hole",x=-width/2,y=height/2,depth=depth,rad=rad);
                        oi("hole",x=-width/2,y=-    height/2,depth=depth,rad=rad);
                    } 
                    else if(item=="cubeRounded" || item=="rectRounded" || item=="rectangleRounded"){
                        OPSCCubeRounded(width=width,height=height,depth=depth,rad=rad);
                    } 
                    else if(item=="oobbBase"){
                        OPSCCubeRounded(width=(width*15)-3,height=(height*15)-3,depth=depth,rad=rad);
                    } 
                    else if(item=="oobbHole"){
                        OPSCInsert("hole",rad=holeM6,x=-(OOwidth*15/2)+((width-1)*15)+15/2,y=-(OOheight*15/2)+((height-1)*15)+15/2);
                    } 
                    else if(item=="oobbHoleClearance"){
                        OPSCInsert("hole",rad=12/2,x=((width-1)*15)+15/2,y=((height-1)*15)+15/2);
                    }                    
                    else if(item=="hole"){
                        OPSCHole(rad);
                    }
                    else if(item=="holeRect"){
                        OPSCHoleRect(width=width,height=height);
                    }                                    
                    //////////////////    OOBB
                    else if(item=="oobb"){
                        OPSCoobbBase(OOwidth,OOheight,holes=holes,depth=depth,color=color);
                    }
                    else if(item=="oobbSlot"){
                        oi("cube",width=3,height=6,depth=100,z=50);
                    }
                    else if(item=="oobbBoltHole" || item=="oobbBoltSocket" ){
                        oi("holeM6");
                        oi("oobbSlot",x=0,y=15);
                        oi("oobbSlot",x=0,y=-15);
                    }
                    else if(item=="oobbBoltPlug"){
                        echo(negative);
                        if(negative){
                            dep = 10;
                           
                            //if(rotZ==-90){
                                //bolt hole
                                oi("cube",x=1.5+6,y=0,width=13,height=6,depth=depth);
                                //nut hole
                                oi("cube",x=5+6,y=0,width=6,height=10,depth=depth);                                
                            //}//else{
                            //
                            //    //bolt hole
                            //    oi("cube",x=1.5,y=0,width=13,height=6,depth=depth);
                            //    //nut hole
                            //    oi("cube",x=5,y=0,width=6,height=10,depth=depth);                                
                            //}
                        }else{
                            oi("cube",x=0,y=15,width=3,height=6,depth=depth);
                            oi("cube",x=0,y=-15,width=3,height=6,depth=depth);                           
                        }
                    }
                    
                    else if(item=="plateOOBB"){
                        OPSCInsert("cubeRounded",width=(width*15)-3,height=(height*15)-3,depth=depth);
                    }
                    else if(item=="OPSCHole"){
                        rad=OPSCHole;
                        OPSCHole(rad);
                    }
                    else if(item=="OPSCHoleSlot"){
                        union(){
                            hull(){
                                OPSCInsert("OPSCHole",x=-3);
                                OPSCInsert("OPSCHole",x=3);
                            }
                        }
                        
                    }
                    //////////////////      HOLES
                    else if(item=="holeM1"){OPSCHole(holeM1);}
                    else if(item=="holeM12D"){OPSCHole(holeM12D);}
                    else if(item=="holeM16D"){OPSCHole(holeM16D);}
                    else if(item=="holeM2"){OPSCHole(holeM2);}
                    else if(item=="holeM3"){OPSCHole(holeM3);}
                    else if(item=="holeM4"){OPSCHole(holeM4);}
                    else if(item=="holeM5"){OPSCHole(holeM5);}
                    else if(item=="holeM6"){OPSCHole(holeM6);}
                    else if(item=="holeM7"){OPSCHole(holeM7);}
                    else if(item=="holeM8"){OPSCHole(holeM8);}
                    else if(item=="holeM9"){OPSCHole(holeM9);}
                    else if(item=="holeM10"){OPSCHole(holeM10);}
                    else if(item=="holeM11"){OPSCHole(holeM11);}
                    else if(item=="holeM12"){OPSCHole(holeM12);}
                    else if(item=="holeM13"){OPSCHole(holeM13);}
                    else if(item=="holeM14"){OPSCHole(holeM14);}
                    else if(item=="holeM15"){OPSCHole(holeM15);}
                    else if(item=="holeM16"){OPSCHole(holeM16);}
                    else if(item=="holeM17"){OPSCHole(holeM17);}
                    else if(item=="holeM18"){OPSCHole(holeM18);}
                    else if(item=="holeM19"){OPSCHole(holeM19);}
                    else if(item=="holeM20"){OPSCHole(holeM20);}
                    else if(item=="holeArray"){
                        for(r=[1:height]){
                            for(c=[1:width]){
                                oi("hole",rad=rad,x=-(width*ex)/2+c*ex-ex/2,y=-(height*ex)/2+r*ex-ex/2, color=color);
                            }
                        }
                    }
                    //////////////////      FASTENERS
                    
                    else if(item=="socketHeadM3"){
                        oi("holeM3");
                        oi("cylinder",rad=socketHeadM3,depth=socketHeadM3Depth,z=socketHeadM3Depth);
                    }else if(item=="countersunkM3"){
                        translate([0,0,-countersunkM3Depth]){
                            cylinder(h=countersunkM3Depth,r1=holeM3,r2=countersunkM3Top);
                        }
                    }
                    //////////////////////  COUPLERS
                    else if(item=="couplerFlangeM5"){
                        rotate([0,0,45]){
                            OPSCInsert("holeM3",0,8);
                            OPSCInsert("holeM3",0,-8);
                            OPSCInsert("holeM3",8,0);
                            OPSCInsert("holeM3",-8,0);
                            OPSCInsert("holeM6",0,0);
                        }
                    }
                    //////////////////    BEARINGS
                    
                    else if(item=="bearing606"){
                            OPSCCylinder(bearing606Big,depth=6);
                            OPSCCylinder(bearing606Little);
                    }
                    else if(item=="bearing608"){
                            OPSCCylinder(bearing608Big,depth=7);
                            OPSCHole(bearing608Little);
                    }
                    else if(item=="Bearing6810"){
                            OPSCHole(OPSCBearing6810Outside,7,0);
                            OPSCHole(OPSCBearing6810Little,100,50);
                    }
                    
                    //////////////////    NUTS                    
                    
                    else if(item=="M3SocketHeadFullNut"){
                        OPSCInsert("M3SocketHeadFull",0,0,0,length=height);
                        OPSCInsert("M3NutCaptiveSingle",0,0,z=-height+OPSCNutM3Height);
                        
                    }
                    else if(item=="M3SocketHeadUpsideDown"){
                        top = OPSCm3SocketHeadHole;
                        bot = OPSCm3SocketHeadHole;
                        height = OPSCm3SocketHeadDepth;
                        OPSCCountersink3DComplete(0,0,top,bot,height,height);
                    }

                    else if(item=="M3NutCaptive"){
                       OPSCPolygon3DComplete(6,0,0,OPSCNutM3Width/2,height,0);
                    }
                    else if(item=="M3NutClearance"){  ///clearnce for an m3 nut
                        translate([0,0,-height]){
                            linear_extrude(height){
                                circle(6.2/2);
                            }
                        }
                    }
                    else {
                        TAXAInsert(item,x,y,z,ex,length,rotX,rotY,rotZ,width,height,depth,rad,color,alpha,OOwidth,OOheight,holes,negative);
                    }
                    
                  
                  
              }
        }
    }   
}
