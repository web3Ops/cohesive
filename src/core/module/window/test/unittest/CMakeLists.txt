add_executable(window-test window-test)

add_test(NAME window-test COMMAND window-test)

target_link_libraries(window-test PRIVATE Qt::Test)