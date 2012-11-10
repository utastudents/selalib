# FFTW_INCLUDE_DIR = fftw3.f03
# FFTW_LIBRARIES = libfftw3.a
# FFTW_FOUND = true if FFTW3 is found

SET(TRIAL_PATHS 
                $ENV{FFTW_ROOT}/include
                $ENV{FFTW_HOME}/include
                /usr/include
                /usr/local/include
                /opt/local/include
                /usr/apps/include
 )

 SET(TRIAL_LIBRARY_PATHS
                          $ENV{FFTW_ROOT}/lib
                          $ENV{FFTW_HOME}/lib
                          /usr/lib
                          /usr/local/lib
                          /opt/local/lib
                          /sw/lib
 )

FIND_PATH(FFTW_INCLUDE_DIR fftw3.f03 ${TRIAL_PATHS})
FIND_PATH(FFTW_MPI_INCLUDE_DIR fftw3-mpi.f03 ${TRIAL_PATHS})

FIND_LIBRARY(FFTW_LIBRARY fftw3 ${TRIAL_LIBRARY_PATHS})
FIND_LIBRARY(FFTW_THREADS_LIBRARY fftw3_threads ${TRIAL_LIBRARY_PATHS})
FIND_LIBRARY(FFTW_MPI_LIBRARY fftw3_mpi ${TRIAL_LIBRARY_PATHS})

IF(FFTW_LIBRARY)
   SET(FFTW_LIBRARIES ${FFTW_LIBRARY})
ELSE()
   MESSAGE(SEND_ERROR "No fftw3 installation")
ENDIF()

IF(FFTW_THREADS_LIBRARY)
   SET(FFTW_LIBRARIES ${FFTW_LIBRARY} ${FFTW_THREADS_LIBRARY})
ELSE()
   MESSAGE(STATUS "No threaded fftw3 installation")
ENDIF()

IF(FFTW_MPI_LIBRARY)
   SET(FFTW_LIBRARIES ${FFTW_LIBRARY} ${FFTW_THREADS_LIBRARY} ${FFTW_MPI_LIBRARY})
ELSE()
   MESSAGE(STATUS "No mpi fftw3 installation")
ENDIF()

SET(FFTW_FOUND FALSE)

IF(FFTW_INCLUDE_DIR AND FFTW_LIBRARIES)
   MESSAGE(STATUS "FFTW_INCLUDE_DIRS=${FFTW_INCLUDE_DIR}")
   MESSAGE(STATUS "FFTW_LIBRARIES=${FFTW_LIBRARIES}")
   SET(FFTW_FOUND TRUE)
ENDIF()

MARK_AS_ADVANCED( FFTW_INCLUDE_DIR
                  FFTW_MPI_INCLUDE_DIR
                  FFTW_LIBRARIES
                  FFTW_FOUND              )
