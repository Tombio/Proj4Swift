# Proj4Swift
[![Build Status](https://travis-ci.org/victorlin/Proj4Swift.svg?branch=master)](https://travis-ci.org/victorlin/Proj4Swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/victorlin/Proj4Swift)
[![GitHub license](https://img.shields.io/github/license/victorlin/Proj4Swift.svg)](https://github.com/victorlin/Proj4Swift/blob/master/LICENSE)

[Proj.4](https://trac.osgeo.org/proj/) wrapper in Swift 2 language

## Install with Carthage

To install with [Carthage](https://github.com/Carthage/Carthage), add Proj4Swift to your Cartfile:

```
github "victorlin/Proj4Swift"
```

## Usage

Just create `Projection`s with Proj.4 parameters, and create `Point3D`s for the input points, then call `Projection.transform` on the source `Projection` with the `Point3D`s and the destination `Projection`.

```Swift
let projWGS84 = try! Projection(parameters: "+proj=longlat +ellps=WGS84 +no_defs")
let projMerc = try! Projection(parameters: "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs")

let points = [
    Point3D(
        x: Double(-122.389349) * Projection.degToRad,
        y: Double(37.778441) * Projection.degToRad,
        z: 0
    )
]
let resultPoints = try! projWGS84.transform(points, toProjection: projMerc)
print(resultPoints)
```

**Remember the lat and long you passed in should be in radian instead of degree**. To convert degree to radian, you can multiply `Projection.degToRad`. 
