

// For inserting TAXA items
// ex used for items with mounting screws to control height of countersunk screw heads
// rad used for extra clearance around items
module TAXAInsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    if(item == "hexIDHoles" || item=="led100wHoles"){
        holeSpacing = 34;
        oi("holeM3",x=-holeSpacing/2,y=-holeSpacing/2);
        oi("holeM3",x=holeSpacing/2,y=holeSpacing/2);
        oi("holeM3",x=-holeSpacing/2,y=holeSpacing/2);
        oi("holeM3",x=holeSpacing/2,y=-holeSpacing/2);
    }
    else if(item == "hexIDHole" || item=="pocketMagnifierHole"){
        oi("cube",width=80,height=43,depth=100,z=50);
    }
    else if(item == "hexIDN20" || item=="n20Motor"){
        //motor
        oi("cube",width=12+2,height=10+2,depth=30,z=0);
        //shaft
        oi("cylinder",rad=5/2,depth=10,z=10);
        //screw holes
        oi("cylinder",rad=holeM16D,x=4.5,z=10,depth=10);
        oi("cylinder",rad=holeM16D,x=-4.5,z=10,depth=10);
        
    }
    else if(item == "hexIDGearMotor1" || item=="gearMotor1"){
        //motor
        oi("cube",x=-21.5,width=65+rad,height=22.5+rad,depth=21,z=0);
        oi("cube",x=13.5,width=5+rad,height=6+rad,depth=3+rad,z=-11+rad/2);
        //shaft (7 diameter)
        //shaft clearance
        oi("cylinder",rad=20/2,depth=33,z=6);
        oi("cylinder",x=-11.25,rad=5/2,depth=33,z=3);
        oi("holeM3",x=13.5,y=0);
        oi("holeM3",x=-20,y=9);
        oi("holeM3",x=-20,y=-9);
        if(ex != 0){
            oi("countersunkM3",x=13.5,y=0,z=ex);
            oi("countersunkM3",x=-20,y=9,z=ex);
            oi("countersunkM3",x=-20,y=-9,z=ex);
        }
        //shaft
    }
    else if(item == "hexIDGearMotor1Shaft" || item=="gearMotor1Shaft"){
        //shaft
        union(){
            //shaft
            difference(){
                oi("cylinder",rad=7/2,depth=100,z=50);
                oi("cube",width=1.1,height=7,x=2.95,depth=6);
                oi("cube",width=1.1,height=7,x=-2.95,,depth=100,z=50);
            }
            //cutout square
            oi("cube",width=7.5,height=1.5,x=3.75,depth=100,z=50);
            //clearance hoop
            difference(){
                //big cyulinder
                oi("cylinder",rad=17/2,depth=100,z=50);
                //little cylinder
                oi("cylinder",rad=13/2,depth=100,z=50);
                oi("cube",width=7,height=20,depth=100,z=50,x=-5.9);
            }
        }
        
        
    }
    else if(item == "hexIDbuttonM7" || item=="buttonM7"){
        oi("cylinder",rad=holeM7,depth=11,z=11);
        oi("cylinder",rad=holeM10+rad,depth=18,z=0);
    }
    else if(item == "hexIDbatteryAAASINGTH" || item=="batteryAAASINGTH"){
        oi("cube",width=51+rad,height=13+rad,depth=13+rad);
        oi("holeM2",x=22.5);
        oi("holeM2",x=-22.5);
        
    }
    else if(item == "ooebWIMOT"){
        //ex = extra padding around
        //rad = extra height
        if(ex == 0 && rad == 0){
            dep=2.54+ 0.06;
            ext=0.1;
            union(){
                oi("cube",x=11.27,y=0,width=22.54+ext,height=5.08+ext,depth=dep);
                oi("cube",x=7.27,y=0,width=2.54+ext,height=10.16+ext,depth=dep);
                oi("cube",x=25.77,y=0,width=6.46+ext,height=3.08+ext,depth=dep);
            }
        }else{
            dep=2.54+ rad;
            ext=ex;
            echo("TEST");
            union(){
                oi("cube",x=11.27,y=0,width=22.54+ext,height=5.08+ext,depth=dep);
                oi("cube",x=7.27,y=0,width=2.54+ext,height=10.16+ext,depth=dep);
                oi("cube",x=25.77,y=0,width=6.46+ext,height=3.08+ext,depth=dep);
            
        
            }
        
        }
    }
}