
# for the documentation
find_package(Doxygen)
if(DOXYGEN_FOUND)
   get_filename_component(DOXYGEN_OUTPUT_DIR ${CMAKE_CURRENT_SOURCE_DIR} PATH)
   set(DOXYGEN_OUTPUT_DIR ${CMAKE_BINARY_DIR})
   message(STATUS "The documentation is in ${DOXYGEN_OUTPUT_DIR}")
   configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in 
   ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile @ONLY)
   add_custom_target(doc ${DOXYGEN_EXECUTABLE} 
   ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile WORKING_DIRECTORY 
   ${CMAKE_CURRENT_BINARY_DIR} 
   COMMENT "Generating API documentation with Doxygen" VERBATIM)
else(DOXYGEN_FOUND)
   MESSAGE(STATUS "DOXYGEN NOT FOUND")
endif(DOXYGEN_FOUND)
