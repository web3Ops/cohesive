add_executable(edit-test edit-test)

add_test(NAME edit-test COMMAND edit-test)

target_link_libraries(edit-test PRIVATE Qt::Test)