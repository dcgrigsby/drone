include <wedge.scad>;

body_height = 8;
body_thickness = 4;
thickness = 2;
height = body_height + 4 * thickness; /* triangles height is 3x thickness */
width = 6;
length = body_thickness + (body_thickness * 2 - body_thickness/2) + thickness * 2;
/*       ^^^ frame         ^^^ clip hole in arm                                    */

/*translate([height / 2, -width, 0]) {*/
  /*rotate([0, -90, 0]) {*/
    cube(size=[width, thickness, height]);
    translate([0, length - thickness, 0]) {
      cube(size=[width, thickness, height]);
    }
    translate([0, 0, height - thickness]) {
      cube(size=[width, length, thickness]);
    }

    /* triangles height is 3x thickness */
    translate([0, thickness, thickness * 3 - 1]) {
      rotate([0, 90, 0]) {
        wedge(90, thickness * 3 - 1, thickness, width);
      }
    }

    /* triangles height is 3x thickness */
    translate([width, length - thickness, thickness * 3 - 1]) {
      rotate([0, 90, 180]) {
        wedge(90, thickness * 3 - 1, thickness, width);
      }
    }
  /*}*/
/*}*/
