cmake_minimum_required(VERSION 3.4.1)

add_library( # Specifies the name of the library.
             hello-world

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
        hello_world.c)

find_library( log-lib log )

target_link_libraries( hello-world ${log-lib} )