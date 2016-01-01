// Hombro del robot
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
