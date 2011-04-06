itk_module_test()

set( ITK-IO-MeshTests
  itkIOMeshHeaderTest.cxx
  MeshFileReadWriteTest.cxx
  MeshFileReadWriteVectorAttributeTest.cxx
  PolylineReadWriteTest.cxx
)

CreateTestDriver(ITK-IO-Mesh "${ITK-IO-Mesh-Test_LIBRARIES}" "${ITK-FooTests}" )

add_test(NAME MeshFileReadWriteTest_1
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/input.vtk
      ${ITK_TEST_OUTPUT_DIR}/output.vtk
)

add_test(NAME MeshFileReadWriteTest_2
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/lh.sphere.fsb
      ${ITK_TEST_OUTPUT_DIR}/lh_sphere.vtk
)
add_test(NAME MeshFileReadWriteTest_3
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/lh.sphere.fsb
      ${ITK_TEST_OUTPUT_DIR}/lh_sphere.fsb
)
add_test(NAME MeshFileReadWriteTest_4
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/lh.sphere_thickness.vtk
      ${ITK_TEST_OUTPUT_DIR}/lh_sphere_thickness.vtk
)
add_test(NAME MeshFileReadWriteTest_5
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/lh.thickness.fcv
      ${ITK_TEST_OUTPUT_DIR}/lh_thickness.fcv
)
add_test(NAME MeshFileReadWriteTest_6
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/rh.pial.fsa
      ${ITK_TEST_OUTPUT_DIR}/rh_pial.fsa
)

add_test(NAME MeshFileReadWriteTest_7
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/cube.byu
      ${ITK_TEST_OUTPUT_DIR}/cube.byu
)
add_test(NAME MeshFileReadWriteTest_8
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/lh.sphere_thickness_b.vtk
      ${ITK_TEST_OUTPUT_DIR}/lh_sphere_thickness_a.vtk
1
)
add_test(NAME MeshFileReadWriteTest_9
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteVectorAttributeTest
      ${ITK_DATA_ROOT}/Baseline/IO/sphere_normals.vtk
      ${ITK_TEST_OUTPUT_DIR}/sphere_normals.vtk
)
add_test(NAME MeshFileReadWriteTest_10
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/octa.off
      ${ITK_TEST_OUTPUT_DIR}/octa.off
)
add_test(NAME MeshFileReadWriteTest_11
      COMMAND ITK-IO-MeshTestDriver MeshFileReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/box.obj
      ${ITK_TEST_OUTPUT_DIR}/box.obj
)
add_test(NAME MeshFileReadWriteTest_12
      COMMAND ITK-IO-MeshTestDriver PolylineReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/fibers.vtk
      ${ITK_TEST_OUTPUT_DIR}/fibers.vtk
)
add_test(NAME MeshFileReadWriteTest_13
      COMMAND ITK-IO-MeshTestDriver PolylineReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/fibers.vtk
      ${ITK_TEST_OUTPUT_DIR}/fibers_binary.vtk
      1
)
add_test(NAME MeshFileReadWriteTest_14
      COMMAND ITK-IO-MeshTestDriver PolylineReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/lh.bert.pial.gii
      ${ITK_TEST_OUTPUT_DIR}/lh.bert.pial.gii
)
add_test(NAME MeshFileReadWriteTest_15
      COMMAND ITK-IO-MeshTestDriver PolylineReadWriteTest
      ${ITK_DATA_ROOT}/Baseline/IO/lh.aparc.gii
      ${ITK_TEST_OUTPUT_DIR}/lh.aparc.gii
)
