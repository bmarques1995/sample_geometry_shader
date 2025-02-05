# CMakeList.txt: projeto de CMake para sample_geometry_shader, incluir origem e definir
# lógica específica a um projeto aqui.
#

# Adicione a origem ao executável deste projeto.
file(GLOB_RECURSE SAMPLE_HDRS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "src/*.hpp")
file(GLOB_RECURSE SAMPLE_SRCS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "src/*.cpp")

add_executable (sample_geometry_shader ${SAMPLE_HDRS} ${SAMPLE_SRCS})

set_property(TARGET sample_geometry_shader PROPERTY CXX_STANDARD 20)

# TODO: Adicione testes e instale destinos, se necessário.
