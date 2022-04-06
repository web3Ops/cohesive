add_executable(run-test run-test)

add_test(NAME run-test COMMAND run-test)

target_link_libraries(run-test PRIVATE Qt::Test)