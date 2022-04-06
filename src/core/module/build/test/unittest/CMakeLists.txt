add_executable(build-test build-test)

add_test(NAME build-test COMMAND build-test)

target_link_libraries(build-test PRIVATE Qt::Test)