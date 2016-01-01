// Brazo Inferior del robot

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
