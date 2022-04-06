add_executable(navigate-test navigate-test)

add_test(NAME navigate-test COMMAND navigate-test)

target_link_libraries(navigate-test PRIVATE Qt::Test)