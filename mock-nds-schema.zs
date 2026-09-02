// Zserio schema for an NDS.Live Smart Layer (Lane Topology)
package nds.map.lane_topology;

// Uses delta coordinates rather than strings to minimize payload size
struct DeltaCoordinate {
    int32 deltaX;
    int32 deltaY;
};

// Represents the physical centerline of the lane
struct Geometry {
    DeltaCoordinate coordinates[];
};

// Represents a single drivable segment within a tile
struct LaneSegment {
    uint32  segmentId;
    uint16  speedLimitKph;
    bool    isNavigable;
    
    Geometry geometry;
};

// The primary smart layer payload sent to the vehicle client
struct LaneTopologyLayer {
    string tileId;
    LaneSegment laneSegments[];
};
