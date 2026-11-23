# Output of the place-recognition block (place encoder + HTM Temporal Memory).
#
# The encoder SDR is the input of the HTM block. The winner cells and the
# anomaly score are the HTM output for the current observation.

std_msgs/Header header

# ---- Place encoder output (HTM input) ----
uint32 sdr_size          # total number of bits of the encoder SDR (e.g. 41800)
uint32[] sdr             # indices of the active bits (sparse representation)

# ---- HTM Temporal Memory state ----
uint32 num_columns       # number of mini-columns (= sdr_size)
uint32 cells_per_column  # cells per mini-column
uint32[] winner_cells    # sparse cell indices: column * cells_per_column + cell
float64 anomaly          # TM anomaly score for this step, in [0, 1]
uint32 iteration         # number of TM steps processed so far
