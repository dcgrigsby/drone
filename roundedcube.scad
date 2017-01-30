/* Using the simple/faster version: https://gist.githubusercontent.com/groovenectar/292db1688b79efd6ce11/raw/b20f70c7a8e6daf0f8a1f182de44657399099c27/roundedcube_simple.scad*/
/* For more configurable/slower version, use: https://gist.githubusercontent.com/groovenectar/92174cb1c98c1089347e/raw/dfec4136b0f8e2d4da3a58d74b6d60661626b611/roundedcube.scad*/

// Set to 0.01 for higher definition curves (renders slower)
$fs = 0.1;

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5) {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate = (center == false) ?
		[radius, radius, radius] :
		[
			radius - (size[0] / 2),
			radius - (size[1] / 2),
			radius - (size[2] / 2)
	];

	translate(v = translate)
	minkowski() {
		cube(size = [
			size[0] - (radius * 2),
			size[1] - (radius * 2),
			size[2] - (radius * 2)
		]);
		sphere(r = radius);
	}
}
