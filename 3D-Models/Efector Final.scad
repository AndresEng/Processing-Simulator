// Efector Final del robot

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
