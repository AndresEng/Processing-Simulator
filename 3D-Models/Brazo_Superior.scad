// Brazo Superior del robot

translate([225,0,0])
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
		
