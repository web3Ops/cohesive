add_executable(help-test help-test)

add_test(NAME help-test COMMAND help-test)

target_link_libraries(help-test PRIVATE Qt::Test)