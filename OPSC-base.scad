 include <OPSC-polygon.scad>;
 include <OPSC-dimensions.scad>;
 include <OPSC-insert.scad>;

shift=100;

module OPSCbuild(){
    if(i==0){
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

 
module OPSCHole(rad){
    depth = 500;
    OPSCCylinder(rad,depth,z=depth/2);
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

module OPSCSphere(rad,x=0,y=0,z=0){
    translate([x,y,z-depth]){
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