add_executable(tools-test tools-test)

add_test(NAME tools-test COMMAND tools-test)

target_link_libraries(tools-test PRIVATE Qt::Test)