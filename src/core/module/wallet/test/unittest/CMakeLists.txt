add_executable(wallet-test wallet-test)

add_test(NAME wallet-test COMMAND wallet-test)

target_link_libraries(wallet-test PRIVATE Qt::Test)