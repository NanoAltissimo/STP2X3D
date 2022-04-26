# - Try to find OpenCascade
# Once done, this will define
#
# OpenCascade_FOUND - OpenCascade is installed
# OpenCascade_INCLUDE_DIRS
# OpenCascade_LIB_DIR
# OpenCascade_LIBRARIES

# include(LibFindMacros)

if (OpenCascade_INCLUDE_DIR AND OpenCascade_LIB_DIR)
  SET (OpenCascade_INCLUDE_DIR OpenCascade_INCLUDE_DIRS-NOTFOUND)
  SET (OpenCascade_LIB_DIR OpenCascade_LIB-NOTFOUND)
endif (OpenCascade_INCLUDE_DIR AND OpenCascade_LIB_DIR)

MESSAGE(STATUS "Looking for OpenCascade...")

SET(CASROOT /usr/lib64/opencascade/)
MESSAGE(STATUS "CASROOT: ${CASROOT}")

find_path(OpenCascade_INCLUDE_DIR
	NAMES STEPCAFControl_Reader.hxx
	PATHS /usr/include/opencascade
	NO_DEFAULT_PATH
)

if (OpenCascade_INCLUDE_DIR)
	MESSAGE(STATUS "Include Dir found: ${OpenCascade_INCLUDE_DIR}")
endif (OpenCascade_INCLUDE_DIR)

find_path(OpenCascade_LIB_DIR
	NAMES libTKSTEP.so
	PATHS ${CASROOT}
	NO_DEFAULT_PATH
)

if (OpenCascade_LIB_DIR)
	MESSAGE(STATUS "LIB Dir found: ${OpenCascade_LIB_DIR}")
	SET(OpenCascade_LIBRARIES -L${OpenCascade_LIB_DIR}
    -lTKBinL
    -lTKBin
    -lTKBinTObj
    -lTKBinXCAF
    -lTKBool
    -lTKBO
    -lTKBRep
    -lTKCAF
    -lTKCDF
    -lTKernel
    -lTKFeat
    -lTKFillet
    -lTKG2d
    -lTKG3d
    -lTKGeomAlgo
    -lTKGeomBase
    -lTKHLR
    -lTKIGES
    -lTKLCAF
    -lTKMath
    -lTKMesh
    -lTKMeshVS
    -lTKOffset
    -lTKOpenGl
    -lTKPrim
    -lTKRWMesh
    -lTKService
    -lTKShHealing
    -lTKStdL
    -lTKStd
    -lTKSTEP209
    -lTKSTEPAttr
    -lTKSTEPBase
    -lTKSTEP
    -lTKSTL
    -lTKTObj
    -lTKTopAlgo
    -lTKV3d
    -lTKVCAF
    -lTKVRML
    -lTKXCAF
    -lTKXDEIGES
    -lTKXDESTEP
    -lTKXMesh
    -lTKXmlL
    -lTKXml
    -lTKXmlTObj
    -lTKXmlXCAF
    -lTKXSBase
	)
endif (OpenCascade_LIB_DIR)

if (OpenCascade_INCLUDE_DIR AND OpenCascade_LIB_DIR)
	set(OpenCascade_FOUND TRUE)
endif (OpenCascade_INCLUDE_DIR AND OpenCascade_LIB_DIR)

if (OpenCascade_FOUND)
	MESSAGE(STATUS "Looking for OpenCascade... - found ${OpenCascade_LIB_DIR}")
	SET(LD_LIBRARY_PATH ${LD_LIBRARY_PATH} ${OpenCascade_LIB_DIR})
else (OpenCascade_FOUND)
    if (OpenCascade_FIND_REQUIRED)
	message(FATAL_ERROR "Looking for OpenCascade... - Not found")
    endif (OpenCascade_FIND_REQUIRED)
endif (OpenCascade_FOUND)
