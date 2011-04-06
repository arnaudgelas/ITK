set(ITK-IO-Mesh_SRC
  itkBYUMeshIO.cxx
  itkMeshIOBase.cxx
  itkBYUMeshIOFactory.cxx
  itkMeshIOFactory.cxx
  itkFreeSurferAsciiMeshIO.cxx
  itkOBJMeshIO.cxx
  itkFreeSurferAsciiMeshIOFactory.cxx
  itkOBJMeshIOFactory.cxx
  itkFreeSurferBinaryMeshIO.cxx
  itkOFFMeshIO.cxx
  itkFreeSurferBinaryMeshIOFactory.cxx
  itkOFFMeshIOFactory.cxx
  itkGiftiMeshIO.cxx
  itkVTKPolyDataMeshIO.cxx
  itkGiftiMeshIOFactory.cxx
  itkVTKPolyDataMeshIOFactory.cxx
)

add_library(ITK-IO-Mesh ${ITK-IO-Mesh_SRC})
target_link_libraries(ITK-IO-Mesh ${ITK-IO-Mesh_LIBRARIES})

itk_module_target(ITK-IO-Mesh)
