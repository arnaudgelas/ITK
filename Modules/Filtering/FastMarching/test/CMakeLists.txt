itk_module_test()
set(ITK-FastMarchingTests
itkFastMarchingHeaderTest.cxx
itkFastMarchingExtensionImageFilterTest.cxx
itkFastMarchingTest.cxx
itkFastMarchingTest2.cxx
itkFastMarchingUpwindGradientTest.cxx
# New files
itkFastMarchingBaseTest.cxx
itkFastMarchingImageFilterBaseTest.cxx
itkFastMarchingImageFilterRealTest1.cxx
itkFastMarchingImageFilterRealTest2.cxx
itkFastMarchingImageTopologicalTest.cxx
itkFastMarchingQuadEdgeMeshFilterBaseTest2.cxx
itkFastMarchingQuadEdgeMeshFilterBaseTest3.cxx
itkFastMarchingQuadEdgeMeshFilterBaseTest.cxx
itkFastMarchingStoppingCriterionBaseTest.cxx
itkFastMarchingThresholdStoppingCriterionTest.cxx
itkFastMarchingUpwindGradientBaseTest.cxx
)

CreateTestDriver(ITK-FastMarching "${ITK-FastMarching-Test_LIBRARIES}" "${ITK-FastMarchingTests}")

add_test(NAME itkFastMarchingHeaderTest
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingHeaderTest)
add_test(NAME itkFastMarchingExtensionImageFilterTest
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingExtensionImageFilterTest)
add_test(NAME itkFastMarchingTest
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingTest)
add_test(NAME itkFastMarchingTest2
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingTest2)
add_test(NAME itkFastMarchingUpwindGradientTest
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingUpwindGradientTest)

add_test(NAME itkImageFastMarchingBaseTest
      COMMAND ITK-FastMarchingTestDriver itkImageFastMarchingBaseTest 0 )
