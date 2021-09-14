 include <OPSC-polygon.scad>;
 include <OPSC-dimensions.scad>;
 include <OPSC-insert.scad>;



module OPSCbuild(shift=100){
    if(i==11){
        if(o=="LAZE"){
            translate([shift*0,0,0]){
                projection(){
                    draw1();
                }
            }
            translate([shift*1,0,0]){
                projection(){
                    draw2();
                }
            }
            translate([shift*2,0,0]){
                projection(){
                    draw3();
                }
            }
            translate([shift*3,0,0]){
                projection(){
                    draw4();
                }
            }
            translate([shift*4,0,0]){
                projection(){
                    draw5();
                }
            }
            translate([shift*5,0,0]){
                projection(){
                    draw6();
                }
            }
            translate([shift*6,0,0]){
                projection(){
                    draw7();
                }
            }
            translate([shift*7,0,0]){
                projection(){
                    draw8();
                }
            }
            translate([shift*8,0,0]){
                projection(){
                    draw9();
                }
            }
            translate([shift*9,0,0]){
                projection(){
                    draw10();
                }
            }
        }else{
            translate([shift*0,0,0]){
                draw1();
            }
            translate([shift*1,0,0]){
                draw2();
            }
            translate([shift*2,0,0]){
                draw3();
            }
            translate([shift*3,0,0]){
                draw4();
            }
            translate([shift*4,0,0]){
                draw5();
            }
            translate([shift*5,0,0]){
                draw6();
            }
            translate([shift*6,0,0]){
                draw7();
            }
            translate([shift*7,0,0]){
                draw8();
            }
            translate([shift*8,0,0]){
                draw9();
            }
            translate([shift*9,0,0]){
                draw10();
            }        
        }
    }
    if(i==1){
        if(o=="LAZE"){
            projection(){
                draw1();
            }
        }else{  
                draw1();  
        }
    }
    if(i==2){
        if(o=="LAZE"){
            projection(){
                draw2();
            }
        }else{  
                draw2();  
        }
    }
    if(i==3){
        if(o=="LAZE"){
            projection(){
                draw3();
            }
        }else{  
                draw3();  
        }
    }
    if(i==4){
        if(o=="LAZE"){
            projection(){
                draw4();
            }
        }else{  
                draw4();  
        }
    }
    if(i==5){
        if(o=="LAZE"){
            projection(){
                draw5();
            }
        }else{  
                draw5();  
        }
    }
    if(i==6){
        if(o=="LAZE"){
            projection(){
                draw6();
            }
        }else{  
                draw6();  
        }
    }
    if(i==7){
        if(o=="LAZE"){
            projection(){
                draw7();
            }
        }else{  
                draw7();  
        }
    }
    if(i==8){
        if(o=="LAZE"){
            projection(){
                draw8();
            }
        }else{  
                draw8();  
        }
    }
    if(i==9){
        if(o=="LAZE"){
            projection(){
                draw9();
            }
        }else{  
                draw9();  
        }
    }
    if(i==10){
        if(o=="LAZE"){
            projection(){
                draw10();
            }
        }else{  
                draw10();  
        }
    }
}

 
module OPSCHole(rad,depth=0){
    if(depth==0){
        d = 500;
        OPSCCylinder(rad,d,z=d/2);
    }else{
        OPSCCylinder(rad,depth,z=depth/2);
    }
}

module OPSCRoundedClearance(rad,stretch=20){
    hull(){
        oi("hole",rad=rad,x=0,y=0);
        oi("hole",rad=rad,x=0,y=stretch);
        oi("hole",rad=rad,x=stretch,y=0);
        oi("hole",rad=rad,x=stretch,y=stretch);
    }
}
module OPSCHoleRect(width,height){
    depth = 500;
    OPSCCube(width,height,depth=depth,z=depth/2);
}

module OPSCCylinder(rad,depth,x=0,y=0,z=0){
    translate([x,y,z-depth]){
        linear_extrude(depth){
            circle(rad);
        }
    }
}

module OPSCCone(rad,rad2,depth,x=0,y=0,z=0){
    translate([x,y,z-depth/2]){
        cylinder(h=depth,r1=rad,r2=rad2,center=true);
    }
}

module OPSCSphere(rad,x=0,y=0,z=0){
    translate([x,y,z]){
        sphere(rad);
    }
}

module OPSCCube(width,height,depth,x=0,y=0,z=0){
    translate([x,y,z-depth]){
        linear_extrude(depth){
            square([width,height],true);
        }
    }
}

module OPSCCubeRounded(width,height,depth,rad=5,x=0,y=0,z=0){
    translate([x,y,z-depth]){
        linear_extrude(depth){
            if(rad==0){
                offset(r=5){
                    rad2=5;
                    square([width-rad2*2,height-rad2*2],true);
                }
            }else{                
                offset(r=rad){
                    square([width-rad*2,height-rad*2],true);
                }

                
            }
        }
    }
}

module OPSCTriangle(width,height,depth,ex="R"){
    if(ex == "L"){
        mirror([1,0,0]){
            translate([-width/2,-height/2,-depth]){
                points=[[0,0],[width,0],[0,height]];
                linear_extrude(depth){
                    polygon(points);
                }
            }
        }
    }else{
        mirror([0,0,0]){
            translate([-width/2,-height/2,-depth]){
                points=[[0,0],[width,0],[0,height]];
                linear_extrude(depth){
                    polygon(points);
                }
            }
        }
        
    }
    
}

module OPSCPolygon(sides=6,x=0,y=0,rad,depth,z=0){    
   translate([x,y,z-depth]){
       linear_extrude(depth){
           Polygon(N=sides,R=rad,h=0);
       }
   }
}

module OPSCStar(points=5,x=0,y=0,radI,radO,depth,z=0){    
   translate([x,y,z-depth]){
       linear_extrude(depth){
           Star(points=points,outer=radO,inner=radI);
       }
   }
}

module OPSCoobbBase(OOwidth,OOheight,depth=3,holes=true,color="gray"){
    
    cornerRad = 5;
    wid = OOBBspacing * OOwidth - 3;
    hei = OOBBspacing * OOheight - 3;
    x = wid/2 - cornerRad;
    y = hei/2 - cornerRad;
    difference(){
        color(color){
            hull(){    
                oi("cylinder",depth=depth,rad=cornerRad,x=x,y=y,color=color); 
                oi("cylinder",depth=depth,rad=cornerRad,x=-x,y=y,color=color); 
                oi("cylinder",depth=depth,rad=cornerRad,x=x,y=-y,color=color); 
                oi("cylinder",depth=depth,rad=cornerRad,x=-x,y=-y,color=color); 
            }
        }
        
        if(holes){
            for(width = [1:OOwidth]){
                for(height = [1:OOheight]){
                    OPSCoobbHole(OOwidth,OOheight,width,height);
                }
            }   
        }
    }
    
    
}

module OPSCoobbHole(OOwidth,OOheight,OOx,OOy){
    x = -OOBBspacing/2 + -(OOwidth * OOBBspacing / 2) + OOx * OOBBspacing;
    y = -OOBBspacing/2 + -(OOheight * OOBBspacing / 2) + OOy * OOBBspacing;
    oi("holeM6",x,y);
}