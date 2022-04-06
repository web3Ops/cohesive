add_executable(view-test view-test)

add_test(NAME view-test COMMAND view-test)

target_link_libraries(view-test PRIVATE Qt::Test)