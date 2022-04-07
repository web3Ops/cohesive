message("\n\n  ##########--- Start configure SOLX ---##########")
file(COPY solx.js DESTINATION .)
set(SG_SOLX_FILE ${CMAKE_CURRENT_BINARY_DIR}/solx.js)
message("\n\n  ##########--- Done configure SOLX ---##########")