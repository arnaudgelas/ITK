/*=========================================================================
 *
 *  Copyright Insight Software Consortium
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0.txt
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 *=========================================================================*/
#ifndef __itkPolyharmonicSplineRadialBasisFunctionKernel_h
#define __itkPolyharmonicSplineRadialBasisFunctionKernel_h

namespace itk
{
template< typename TScalar, unsigned int VOrder >
class PolyharmonicSplineRadialBasisFunctionKernel :
  public CPDRadialBasisFunctionKernelBase< TScalar, TScalar >
{
public:
  typedef PolyharmonicSplineRadialBasisFunctionKernel           Self;
  typedef SmartPointer< Self >                                  Pointer;
  typedef SmartPointer< const Self >                            ConstPointer;
  typedef CPDRadialBasisFunctionKernelBase< TScalar, TScalar >  Superclass;

  /** Run-time type information (and related methods). */
  itkTypeMacro( PolyharmonicSplineRadialBasisFunctionKernel,
                CPDRadialBasisFunctionKernelBase );

  typedef typename Superclass::ScalarType ScalarType;

  unsigned int GetOrder() const
  { return VOrder; }

  ScalarType Evaluate( const ScalarType& iX ) const
  {
    // if VDimension % 2 == 0
    //    return x^k \log x
    // else
    //    return x^k
  }

protected:
  PolyharmonicSplineRadialBasisFunctionKernel() : Superclass() {}
  ~PolyharmonicSplineRadialBasisFunctionKernel() {}

private:
  PolyharmonicSplineRadialBasisFunctionKernel( const Self& );
  void operator( const Self& );
};
}
#endif
