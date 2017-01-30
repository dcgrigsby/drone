/* lightly modified version of http://www.thingiverse.com/thing:58478 */

module roundedcylinder(r=10,r=10,h=10,b=.5)
{translate([0,0,-h/2]) hull(){rotate_extrude() translate([r-b,b,0]) circle(r = b); rotate_extrude() translate([r-b, h-b, 0]) circle(r = b);}}
