# Output of place_context_cells_node (RatSLAM-style local view matching on the
# encoder SDR + HTM winner cells).
#
# Every incoming PlaceContext is compared against the stored
# PlaceContextTemplates by SDR overlap.
#
#   overlap >= match_threshold          -> matched=true, id of that template
#   new_template_threshold <= overlap < match_threshold
#                                       -> matched=false, id of the reused
#                                          template (hysteresis: the place is
#                                          not recognised, the id is only kept
#                                          for continuity)
#   overlap < new_template_threshold    -> matched=false, id of a new template
#
# Only matched=true may inject energy into the pose cells or close a loop.

std_msgs/Header header

bool matched              # true only when overlap reached match_threshold
uint32 context_cell_id    # id of the confident match, reused or new template
float64 relative_rad      # relative yaw of the current cloud w.r.t. the matched template
float64 overlap           # overlap / active bits of the current SDR, in [0, 1]
