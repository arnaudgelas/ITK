set(DOCUMENTATION "This is a collection of classes that are intended to be
removed from the toolkit.")

if(NOT ITKV3_COMPATIBILITY ) ## Deprecated code only work with ITKV3_COMPATIBILITY
  set(EXCLUDE_DEPRECATED_LEGACY_CODE "EXCLUDE_FROM_DEFAULT")
else()
  set(EXCLUDE_DEPRECATED_LEGACY_CODE "")
endif()
itk_module(ITKDeprecated
  DEPENDS
    ITKV3Compatibility      ## Note: Deprecated requires the ITKV3 compatibility layer
    ITKAnisotropicSmoothing
    ITKAntiAlias
    ITKBiasCorrection
    ITKBioCell
    ITKClassifiers
    ITKCommon
    ITKConnectedComponents
    ITKCurvatureFlow
    ITKDeformableMesh
    ITKDisplacementField
    ITKDiffusionTensorImage
    ITKDistanceMap
    ITKDICOMParser
    ITKEigen
    ITKFEM
    ITKFEMRegistration
    ITKFFT
    ITKFiniteDifference
    ITKImageAdaptors
    ITKImageCompare
    ITKImageCompose
    ITKImageFeature
    ITKImageFilterBase
    ITKImageFunction
    ITKImageGradient
    ITKImageGrid
    ITKImageIntensity
    ITKImageLabel
    ITKImageSources
    ITKImageStatistics
    ITKIOImageBase
    ITKIOBioRad
    ITKIOBMP
    ITKIOGDCM
    ITKIOGE
    ITKIOGIPL
    ITKIOIPL
    ITKIOJPEG
    ITKIOMeta
    ITKIONIFTI
    ITKIONRRD
    ITKIOPNG
    ITKIORAW
    ITKIOSiemens
    ITKTransform
    ITKIOTransformBase
    ITKIOTransformMatlab
    ITKIOTransformHDF5
    ITKIOTransformInsightLegacy
    ITKIOSpatialObjects
    ITKIOStimulate
    ITKIOTIFF
    ITKIOVTK
    ITKIOXML
    ITKKLMRegionGrowing
    ITKLabelVoting
    ITKLevelSets
    ITKMarkovRandomFieldsClassifiers
    ITKMathematicalMorphology
    ITKMesh
    ITKNarrowBand
    ITKNeuralNetworks
    ITKOptimizers
    ITKPath
    ITKPDEDeformableRegistration
    ITKPolynomials
    ITKQuadEdgeMesh
    ITKQuadEdgeMeshFiltering
    ITKRegionGrowing
    ITKRegistrationCommon
    ITKSignedDistanceFunction
    ITKSmoothing
    ITKSpatialFunction
    ITKSpatialObjects
    ITKStatistics
    ITKTestKernel
    ITKThresholding
    ITKVoronoi
    ITKVTK
    ITKWatersheds
  TEST_DEPENDS
    ITKAnisotropicSmoothing
    ITKAntiAlias
    ITKBiasCorrection
    ITKBioCell
    ITKClassifiers
    ITKCommon
    ITKConnectedComponents
    ITKCurvatureFlow
    ITKDeformableMesh
    ITKDisplacementField
    ITKDiffusionTensorImage
    ITKDistanceMap
    ITKEigen
    ITKFEM
    ITKFEMRegistration
    ITKFFT
    ITKFiniteDifference
    ITKImageAdaptors
    ITKImageCompare
    ITKImageCompose
    ITKImageFeature
    ITKImageFilterBase
    ITKImageFunction
    ITKImageGradient
    ITKImageGrid
    ITKImageIntensity
    ITKImageLabel
    ITKImageSources
    ITKImageStatistics
    ITKIOImageBase
    ITKIOBioRad
    ITKIOBMP
    ITKIOGDCM
    ITKIOGE
    ITKIOGIPL
    ITKIOIPL
    ITKIOJPEG
    ITKIOMeta
    ITKIONIFTI
    ITKIONRRD
    ITKIOPNG
    ITKIORAW
    ITKIOSiemens
    ITKIOTransformBase
    ITKIOTransformMatlab
    ITKIOTransformHDF5
    ITKIOTransformInsightLegacy
    ITKIOSpatialObjects
    ITKIOStimulate
    ITKIOTIFF
    ITKIOVTK
    ITKIOXML
    ITKKLMRegionGrowing
    ITKLabelVoting
    ITKLevelSets
    ITKMarkovRandomFieldsClassifiers
    ITKMathematicalMorphology
    ITKMesh
    ITKNarrowBand
    ITKNeuralNetworks
    ITKOptimizers
    ITKPath
    ITKPDEDeformableRegistration
    ITKPolynomials
    ITKQuadEdgeMesh
    ITKQuadEdgeMeshFiltering
    ITKRegionGrowing
    ITKRegistrationCommon
    ITKSignedDistanceFunction
    ITKSmoothing
    ITKSpatialFunction
    ITKSpatialObjects
    ITKStatistics
    ITKThresholding
    ITKVoronoi
    ITKVTK
    ITKWatersheds
    ITKTestKernel
  ${EXCLUDE_DEPRECATED_LEGACY_CODE}
  DESCRIPTION
    "${DOCUMENTATION}"
)
