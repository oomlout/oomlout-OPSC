 include <OPSC-polygon.scad>;
 include <OPSC-dimensions.scad>;
 include <OPSC-insert.scad>;
 
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

module OPSCCube(width,height,depth,x=0,y=0,z=0){
    translate([x,y,z-depth]){
        linear_extrude(depth){
            square([width,height],true);
        }
    }
}
