# Keyframe cloud: the point cloud that created a PlaceContextTemplate.
#
# Published by place_context_cells_node only when a new template is created, so
# the experience map can keep a geometric snapshot of each experience.
#
# The cloud is downsampled (voxel grid) and stays in the sensor frame. The map
# stores it relative to the experience and applies the experience pose only
# when publishing, so the points follow map corrections (loop closures).

std_msgs/Header header

uint32 vt_id                  # template id (== pose-cell visual template id)

sensor_msgs/PointCloud2 cloud # x,y,z (float32) in header.frame_id
