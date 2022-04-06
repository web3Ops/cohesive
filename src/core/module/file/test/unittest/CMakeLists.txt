add_executable(file-test file-test)

add_test(NAME file-test COMMAND file-test)

target_link_libraries(file-test PRIVATE Qt::Test)