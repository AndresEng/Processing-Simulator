//******************
// Base del robot
//***********************************************************************************
union()
{
	translate([0,0,-660]) cylinder(h=660 ,r1=360, r2=360, center=false);
	translate([0,0,-660]) cylinder(h=110 ,r1=430, r2=430, center=false);
	translate([0,0,-660]) cylinder(h=60 ,r1=460, r2=460, center=false);
	translate([-360,-360,-660])  minkowski()
	{
		cube(size = [730,730,30], center = false);
		cylinder(h=30 ,r1=80, r2=80, center=false);
	}
	translate([0,0,-100]) cylinder(h=80 ,r1=430, r2=430, center=false);
}
//*****************************
// Fin de la Base del Robot
//***********************************************************************************

//*********************
// Hombro del robot
//***********************************************************************************
union()
{
	rotate_extrude($fn=32)
	translate([405,80,0])circle(r=25);
	rotate_extrude($fn=32)
	translate([215,40,0])square([430,80],center=true);
	rotate_extrude($fn=32)
	translate([203,80,0])square([405,50],center=true);
}

translate([230,0,740])  rotate([0,-90,0])   cylinder(h=460 ,r1=230, r2=230, center=false);

difference()
{
	union()
	{
		translate([0,0,422.5]) cube(size = [400,460,635], center = true);
		difference()
		{
			translate([0,-70,422.5]) cube(size = [400,610,635], center = true);
			translate([00,-400,700]) rotate([40,0,-0])  cube(size = [500,500,500], center = true);
		}
	}
	union()
	{
		translate([-335,-375,410]) rotate([0,0,112])  cube(size = [400,400,700], center = true);
		translate([335,-375,410]) rotate([0,0,-112])  cube(size = [400,400,700], center = true);
	}
}
//*****************************
// Fin del Hombro del robot
//***********************************************************************************

//*****************************
// Brazo Superior del robot
//***********************************************************************************
translate([225,0,740])
rotate([0,90,0])  
union()
{
	union()
	{
		linear_extrude(height = 100, center = false, convexity = 10, scale=0.8)
		hull()
		{
			circle(r=255);
			translate([0,-145,0])square([360,290],center=true);
		}
 
		translate([-180,-145,0])
		rotate([90,0,0])   
		linear_extrude(height = 900, center = false, convexity = 10, scale=1)
		polygon(points=[[0,0],[360,0],[324,100],[36,100]]);

		translate([0,-1270,0])
		rotate([0,0,180])  
		linear_extrude(height = 100, center = false, convexity = 10, scale=0.8)
		hull() 
		{
			circle(r=255);
			translate([0,-145,0])square([360,290],center=true);
		}
	}

	translate([0,-0,-450])
	rotate([0,180,0])  
	union()
	{
		linear_extrude(height = 100, center = false, convexity = 10, scale=0.8)
		hull()
		{
			circle(r=255);
			translate([0,-145,0])square([360,290],center=true);
		}
 
		translate([-180,-145,0])
		rotate([90,0,0])   
		linear_extrude(height = 900, center = false, convexity = 10, scale=1)
		polygon(points=[[0,0],[360,0],[324,100],[36,100]]);

		translate([0,-1270,0])
		rotate([0,0,180])  
		linear_extrude(height = 100, center = false, convexity = 10, scale=0.8)
		hull() 
		{
			circle(r=255);
			translate([0,-145,0])square([360,290],center=true);
		}
	}

	translate([-0,-630,-225]) cube(size = [360,570,450], center = true);
}
		
//**************************************
// Fin del Brazo Superior del robot
//***********************************************************************************

//*****************************
// Brazo  Inferior del robot
//***********************************************************************************
translate([0,-1260,740])
difference()
{
	union()
	{
		rotate([0,90,0])cylinder(h=460 ,r1=230, r2=230, center=true);

		translate([0,250,0])rotate([90,0,0])linear_extrude(height = 775, center = false, convexity = 10, scale=1)
			hull() 
			{
				translate([-53,-35,0])circle(r=126);
				translate([-53,35,0])circle(r=126);
				translate([53,-35,0])circle(r=126);
				translate([53,35,0])circle(r=126);
			}
		translate([0,-1270,0])rotate([0,90,0])cylinder(h=520 ,r1=190, r2=190, center=true);
		translate([-260,-1270,-190]) cube(size = [520,770,380], center = false);
	}		
	translate([-0,-1218,-0]) cube(size = [300,530,420], center = true);
}

//**************************************
// Fin del Brazo Inferior del robot
//***********************************************************************************


//*****************************
// Efector Final del robot
//***********************************************************************************
translate([0,-2530,740])
difference()
{
	union()
	{
		rotate([0,90,0])cylinder(h=310 ,r1=190, r2=190, center=true);
		rotate([90,0,0])cylinder(h=300 ,r1=127, r2=127, center=false);
		translate([0,-250,0])rotate([90,0,0])cylinder(h=84 ,r1=140, r2=140, center=false);
	}
	translate([0,-300,0])rotate([90,0,0])cylinder(h=300 ,r1=100, r2=100, center=false);
}

//**************************************
// Fin del Efector final del robot
//***********************************************************************************

