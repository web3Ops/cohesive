add_executable(solana_gui)

target_include_directories(solana_gui PRIVATE include)

#all .cpp
file(GLOB SOLANA_GUI_SRC "core/*.cpp")
message(STATUS ${SOLANA_GUI_SRC})
# feed . cpp in
target_sources(solana_gui PRIVATE ${SOLANA_GUI_SRC})