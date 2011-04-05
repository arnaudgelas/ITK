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
# itkFastMarchingImageTopologicalTest.cxx
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

add_test(NAME itkFastMarchingBaseTest0
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingBaseTest 0 )
add_test(NAME itkFastMarchingBaseTest1
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingBaseTest 1 )

add_test(NAME itkFastMarchingImageFilterBaseTest
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingImageFilterBaseTest )

add_test(NAME itkFastMarchingImageFilterRealTest1
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingImageFilterRealTest1)

add_test(NAME itkFastMarchingImageFilterRealTest2
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingImageFilterRealTest2)

add_test(NAME itkFastMarchingUpwindGradientBaseTest
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingUpwindGradientBaseTest )

add_test(NAME itkFastMarchingQuadEdgeMeshFilterBaseTest
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingQuadEdgeMeshFilterBaseTest )

add_test(NAME itkFastMarchingQuadEdgeMeshFilterBaseTest2
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingQuadEdgeMeshFilterBaseTest2 )

add_test(NAME itkFastMarchingQuadEdgeMeshFilterBaseTest3
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingQuadEdgeMeshFilterBaseTest3 )

add_test(NAME itkFastMarchingStoppingCriterionBaseTest
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingStoppingCriterionBaseTest )

add_test(NAME itkFastMarchingThresholdStoppingCriterionTest
      COMMAND ITK-FastMarchingTestDriver itkFastMarchingThresholdStoppingCriterionTest )
