# CMakeList.txt: projeto de CMake para sample_geometry_shader, incluir origem e definir
# lógica específica a um projeto aqui.
#

# Adicione a origem ao executável deste projeto.
set(TARGET_NAME sample_geometry_shader)
file(GLOB_RECURSE SAMPLE_HDRS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "src/*.hpp")
file(GLOB_RECURSE SAMPLE_SRCS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "src/*.cpp")

trace_dependency(NAME sdl3 INSTALL_SCRIPT "${PROJECT_SOURCE_DIR}/installers/sdl3.ps1")
trace_dependency(NAME glad INSTALL_SCRIPT "${PROJECT_SOURCE_DIR}/installers/glad.ps1")
trace_dependency(NAME glm INSTALL_SCRIPT "${PROJECT_SOURCE_DIR}/installers/glm.ps1")

add_executable(${TARGET_NAME} ${SAMPLE_HDRS} ${SAMPLE_SRCS})
target_link_libraries(${TARGET_NAME} PUBLIC SDL3::SDL3 glad::glad glm::glm-header-only)

set_cxx_project_standards(${TARGET_NAME} 20 FALSE)

add_custom_target(copy_assets ALL
			COMMAND ${CMAKE_COMMAND} -E copy_directory
			"${CMAKE_CURRENT_SOURCE_DIR}/shaders"
			${CMAKE_PREFIX_PATH}/bin/shaders
			COMMENT "Copying D3D12Core dll into binary directory")
add_dependencies(${TARGET_NAME} copy_assets)



# TODO: Adicione testes e instale destinos, se necessário.
