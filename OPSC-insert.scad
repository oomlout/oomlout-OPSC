
//#########################################################################################
//#########################################################################################
//#########          INSERT ROUTINES
 include <TAXA-insert.scad>;
 include <OOBB-AAA-insert.scad>;


module oi(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    OPSCInsert(item,x,y,z,ex,length,rotX,rotY,rotZ,width,height,depth,rad,rad2,color,alpha,OOwidth,OOheight,holes,negative);
}

module OPSCInsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
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
                    else if(item=="cone"){
                        OPSCCone(rad=rad,rad2=rad2,depth=depth);
                    } 
                    else if(item=="cube" || item=="rect" || item=="rectangle"){
                        OPSCCube(width=width,height=height,depth=depth);
                    }
                    else if(item=="triangle"){
                        OPSCTriangle(width=width,height=height,depth=depth,ex=ex);
                        }  
                    else if(item=="text"){
                        ht=0.15;
                        translate([0,0,-ht]){
                            linear_extrude(height=ht){
                                text(ex,size=height,font="DejaVu Sans Mono",halign="center",valign="center");
                            }
                        }                        
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
                    else if(item=="hole"){OPSCHole(rad,depth=depth);}
                    else if(item=="holeM1"){OPSCHole(holeM1,depth=depth);}
                    else if(item=="holeM12D"){OPSCHole(holeM12D,depth=depth);}
                    else if(item=="holeM16D"){OPSCHole(holeM16D,depth=depth);}
                    else if(item=="holeM2"){OPSCHole(holeM2,depth=depth);}
                    else if(item=="holeM25D"){OPSCHole(holeM25D,depth=depth);}
                    else if(item=="holeM3"){OPSCHole(holeM3,depth=depth);}
                    else if(item=="holeM4"){OPSCHole(holeM4,depth=depth);}
                    else if(item=="holeM5"){OPSCHole(holeM5,depth=depth);}
                    else if(item=="holeM6"){OPSCHole(holeM6,depth=depth);}
                    else if(item=="holeM6Minus"){OPSCHole(holeM6Minus,depth=depth);}
                    else if(item=="holeM7"){OPSCHole(holeM7,depth=depth);}
                    else if(item=="holeM8"){OPSCHole(holeM8,depth=depth);}
                    else if(item=="holeM9"){OPSCHole(holeM9,depth=depth);}
                    else if(item=="holeM10"){OPSCHole(holeM10,depth=depth);}
                    else if(item=="holeM11"){OPSCHole(holeM11,depth=depth);}
                    else if(item=="holeM12"){OPSCHole(holeM12,depth=depth);}
                    else if(item=="holeM13"){OPSCHole(holeM13,depth=depth);}
                    else if(item=="holeM14"){OPSCHole(holeM14,depth=depth);}
                    else if(item=="holeM15"){OPSCHole(holeM15,depth=depth);}
                    else if(item=="holeM16"){OPSCHole(holeM16,depth=depth);}
                    else if(item=="holeM17"){OPSCHole(holeM17,depth=depth);}
                    else if(item=="holeM18"){OPSCHole(holeM18,depth=depth);}
                    else if(item=="holeM19"){OPSCHole(holeM19,depth=depth);}
                    else if(item=="holeM20"){OPSCHole(holeM20,depth=depth);}                
                    else if(item=="holeArray"){
                        for(r=[1:height]){
                            for(c=[1:width]){
                                oi("hole",rad=rad,x=-(width*ex)/2+c*ex-ex/2,y=-(height*ex)/2+r*ex-ex/2, color=color);
                            }
                        }
                    }
                    ///////////////////     ROUNDEDCLEARANCE
                    else if(item=="roundedClearanceM12"){ 
                        OPSCRoundedClearance(rad=holeM12,depth=depth);}
                    ///////////////////     SLOTS
                    else if(item=="slot"){OPSCSlot(rad,depth=depth);}    
                    
                    
                    
                    //////////////////      FASTENERS
                        //capscrew
                    else if(item=="socketHeadM3"){ //DEPRECATED
                        oi("capscrewM3");
                    }else if(item=="capscrewM3"){
                        oi("cylinder",rad=gv("CAPSCREW-M3-TOP"),depth=gv("CAPSCREW-M3-DEPTH"),z=0);
                        //countersunk
                    }else if(item=="countersunkM3"){
                        translate([0,0,-countersunkM3Depth]){
                            cylinder(h=countersunkM3Depth,r1=holeM3,r2=countersunkM3Top);
                        }
                    }else if(item=="countersunkM25D"){
                        translate([0,0,-countersunkM25DDepth]){
                            cylinder(h=countersunkM25DDepth,r1=holeM25D,r2=countersunkM25DTop);
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
                            oi("cylinder",rad=gv("BEARING-606-OUTSIDE"),depth=gv("BEARING-606-DEPTH"));
                        //add hole if EX doesn't equal zero
                        if(ex != 0){
                            oi("cylinder",rad=gv("BEARING-606-OUTSIDE"),depth=100,z=50);
                        }
                    }
                    else if(item=="bearing608"){
                            OPSCCylinder(bearing608Big,depth=7);
                            OPSCHole(bearing608Little);
                    }
                    else if(item=="Bearing6810"){
                            OPSCHole(OPSCBearing6810Outside,7,0);
                            OPSCHole(OPSCBearing6810Little,100,50);
                    }
                    else if(item=="Bearing6810"){
                            OPSCHole(OPSCBearing6810Outside,7,0);
                            OPSCHole(OPSCBearing6810Little,100,50);
                    }
                    else if(item=="bearing6803"){
                            oi("cylinder",rad=gv("BEARING-6803-OUTSIDE"),depth=gv("BEARING-6803-DEPTH"));
                        //add hole if EX doesn't equal zero
                        if(ex != 0){
                            oi("cylinder",rad=gv("BEARING-6803-OUTSIDE"),depth=100,z=50);
                        }
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

                    else if(item=="nutM6"){
                        if(depth == 0){
                            OPSCPolygon(sides=6,rad=gv("NUT-M6-WIDTH")/2,depth=gv("NUT-M6-HEIGHT"));
                        }else{
                            OPSCPolygon(sides=6,rad=gv("NUT-M6-WIDTH")/2,depth=depth);
                        }
                    }
                    else if(item=="M3NutCaptive" || item=="nutM3"){
                        if(depth == 0){
                            OPSCPolygon(6,0,0,OPSCNutM3Width/2,2,0);
                        }else{
                            OPSCPolygon(6,0,0,OPSCNutM3Width/2,depth,0);
                        }
                    }
                    else if(item=="nutM3Slot"){
                        if(depth == 0){
                            hull(){
                                OPSCPolygon(6,0,0,OPSCNutM3Width/2,2,0);
                                
                            }
                        }else{
                            hull(){
                                OPSCPolygon(6,0,0,OPSCNutM3Width/2,depth,0);
                                oi("cube",y=5,width=OPSCNutM3Width,height=OPSCNutM3Width,depth=depth);
                            }
                        }
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
                        OOBBInsert(item,x,y,z,ex,length,rotX,rotY,rotZ,width,height,depth,rad,color,alpha,OOwidth,OOheight,holes,negative);
                    
                  
                  
                }
            }
        }   
    }
}
