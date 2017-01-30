include <roundedcube.scad>;

height = 8;
thickness = 4;
width = 30;
connector_length = 42;
length = 3 * width - thickness * 2 + 2 * connector_length;

for (j=[0, 90]) {
  rotate([0, 0, j]) {
    for (i = [1, -1]) {
      // mains
      translate([i * (width - thickness) / 2, 0, height  / 2]) {
        roundedcube([thickness, length, height], center=true);
      }
      // zip tie anchors
      for (i=[0, 90, 270]) {
        rotate([0, 0, i]) {
          translate([.5 * width + (width - thickness * 1.5), 0, height / 2]) {
            roundedcube(size=[thickness, 25, height], center=true);
          }
        }
      }
      // center torsion bars
      l = sqrt(pow(width - 2 * thickness,2)*2) + thickness / 2;
      translate([0, 0, height / 2]) {
        rotate([0, 0, 45]) {
          roundedcube([thickness, l, height], center=true);
        }
      }
      // column torsion bars
      for (i=[[1,1], [1, -1], [-1, -1], [-1, 1]]) {
        translate([i[0] * (width - thickness), 0, height / 2]) {
          rotate([0, 0, i[1] * 45]) {
            roundedcube([thickness, l, height], center=true);
          }
        }
      }
      for (i=[1, -1]) {
        // inner buttresses
        n = width / 2 + (width / 2 - thickness);
        translate([i * n, i * n, height/2]) {
          rotate([0, 0, -45]) {
            roundedcube(size=[sqrt(pow(width + 2 * thickness, 2)), thickness, height], center=true);
          }
        }
        // outer buttresses
        m = length/2 - width - thickness * 1.4;
        translate([i * m, i * m, height/2]) {
          rotate([0, 0, -45]) {
          roundedcube(size=[sqrt(pow(length/2 - width/2, 2)*2) + thickness / 4, thickness, height], center=true);
          }
        }
      }
      // rails for arms' channels
      for (i=[0, 180]) {
        rotate([0, 0, i]) {
          translate([length / 2 - connector_length - .1, 0, height / 4 + height / 8]) {
            translate([-2, width / 2 - 2 * thickness, 0]) {
              roundedcube(size=[connector_length + 2, thickness + 2, height / 4]);
            }
            translate([-2, - width / 2 + thickness - 2, 0]) {
              roundedcube(size=[connector_length + 2, thickness + 2, height / 4]);
            }
          }
        }
      }
    }
  }
}
