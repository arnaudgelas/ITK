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
#ifndef __itkWendlandRadialBasisFunctionKernel_h
#define __itkWendlandRadialBasisFunctionKernel_h

namespace itk
{
template< typename TScalar, unsigned int VDimension, unsigned int VOrder >
class WendlandRadialBasisFunctionKernel :
  public CSRadialBasisFunctionKernelBase< TScalar >
{
public:
  typedef WendlandRadialBasisFunctionKernel           Self;
  typedef SmartPointer< Self >                        Pointer;
  typedef SmartPointer< const Self >                  ConstPointer;
  typedef CSRadialBasisFunctionKernelBase< TScalar >  Superclass;

  /** Run-time type information (and related methods). */
  itkTypeMacro( WendlandRadialBasisFunctionKernel,
                CSRadialBasisFunctionKernelBase );

  typedef TScalar ScalarType;

  /*
   * VDimension = 1
   *    VOrder = 0
   *        return (1-x)
   *    VOrder = 2
   *        return (1-x)^2 * (3*x+1)
   *    VOrder = 4
   *        return (1-x)^5 * (38*x^2+5*x+1)
   *
   * VDimension = 3 - which also works for VDimension 2
   *    VOrder = 0
   *        return (1-x)^2
   *    VOrder = 2
   *        return (1-x)^4 (4*x+1)
   *    VOrder = 4
   *        return (1-x)^6 * (35*x^2+18*x+3)
   *
   * VDimension = 5 - which also works for VDimension 4
   *    VOrder = 0
   *        return (1-x)^3
   *    VOrder = 2
   *        return (1-x)^5 * (5*x+1)
   *    VOrder = 4
   *        return (1-x)^7 * (16*x^2+7*r+1)
   */

protected:
  WendlandRadialBasisFunctionKernel() : Superclass() {}
  virtual ~WendlandRadialBasisFunctionKernel() {}

private:
  WendlandRadialBasisFunctionKernel( const Self& );
  void operator( const Self& );
};
}
#endif
