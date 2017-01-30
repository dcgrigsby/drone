include <roundedcube.scad>;
include <roundedcylinder.scad>;

length = 180;
height = 8;
thickness = 4;
width = 30;
connector_length = 42;
fa=.1;
fs=.1;
motor_radius = 45 / 2;

translate([0, 0, height]) {
  rotate([0, 180, 0]) {
    difference() {
      union() {
        translate([-(width - 2 * thickness) / 2, 0, 0]) {
          roundedcube([width - 2 * thickness, connector_length + 2, height]);
        }
        // main columns
        translate([-width / 2, connector_length, 0]) {
          roundedcube([thickness, length - connector_length - motor_radius, height]);
        }
        translate([width / 2 - thickness, connector_length, 0]) {
          roundedcube([thickness, length - connector_length - motor_radius, height]);
        }
        // connector main columns row
        translate([-width / 2, connector_length, 0]) {
          roundedcube([width, thickness * 2, height]);
        }
        // motor mount
        translate([0, length - motor_radius, height / 2]) {
          roundedcylinder(r=motor_radius, h=height, $fa=fa, $fs=fs);
        }
        // torsion box
        translate([0, connector_length + 2 * thickness + .5 * (length - connector_length - motor_radius * 2), height  / 2]) {
          for (i=[1, -1]) {
            rotate([0, 0, i * 14]) {
              // todo: calculate length
              roundedcube([thickness, 99, height], center=true);
            }
          }
        }
      }
      /* counter-sink for basket */
      translate([0, connector_length / 2, - height * .25]) {
        cylinder(r=5, h=height, center=true, $fa=fa, $fs=fs);
      }
      /* screw hole */
      translate([0, connector_length / 2, - height]) {
        cylinder(r=1.55, h=100, center=true, $fa=fa, $fs=fs);
      }
      /* engine hole */
      translate([0, length - motor_radius, -10]) {
        cylinder(r=8, h=200, center=true);
      }
      /* channels */
      tolerance = .1;
      translate([-(width - 2 * thickness) / 2 - tolerance, -tolerance, height / 4 + height / 8 - tolerance]) {
        roundedcube([thickness + tolerance * 2, connector_length + 2 * tolerance, height/4 + 2 * tolerance]);
      }
      translate([(width - 2 * thickness) / 2 - thickness - tolerance, -tolerance, height / 4 + height / 8 - tolerance]) {
        roundedcube([thickness + 2 * tolerance, connector_length + 2 * tolerance, height/4 + 2 * tolerance]);
      }
      /* zip-tie mount */
      translate([0, thickness * 2, -10]) {
        roundedcube(size=[thickness * 1.5, thickness, 100], center=true);
      }
      /* motor mount holes */
      translate([0, length - motor_radius, -10]) {
        rotate([0, 0, 45]) {
          for (i=[0, 90, 180, 270]) {
            rotate([0, 0, i]) {
              translate([0, 34/2, 0]) {
                cylinder(r=1.55, h=100, center=true, $fa=fa, $fs=fs);
              }
            }
          }
        }
      }
    }
  }
}
