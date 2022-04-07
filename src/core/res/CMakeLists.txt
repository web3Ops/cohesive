# support qt-creator
file(GLOB_RECURSE SG_RES_FILES
        "${CMAKE_CURRENT_SOURCE_DIR}/*png"
        "${CMAKE_CURRENT_SOURCE_DIR}/*svg"
        "${CMAKE_CURRENT_SOURCE_DIR}/*qml"
        )
file(COPY ${SG_RES_FILES} sg-res.qmlproject
        DESTINATION ${CMAKE_BINARY_DIR}/qmlproject
)