add_executable(core-test core-test.cpp)

add_test(NAME core-test COMMAND core-test)

target_link_libraries(core-test PRIVATE Qt::Test)