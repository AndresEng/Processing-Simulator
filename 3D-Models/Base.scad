// Base del robot

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
