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
#ifndef __itkCSRadialBasisFunctionKernelBase_h
#define __itkCSRadialBasisFunctionKernelBase_h

namespace itk
{
template< typename TScalar >
class CSRadialBasisFunctionKernelBase :
  public SPDRadialBasisFunctionKernelBase< TScalar >
{
public:
  typedef CSRadialBasisFunctionKernelBase                       Self;
  typedef SmartPointer< Self >                                  Pointer;
  typedef SmartPointer< const Self >                            ConstPointer;
  typedef SPDRadialBasisFunctionKernelBase< TScalar, TScalar >  Superclass;

  /** Run-time type information (and related methods). */
  itkTypeMacro( CSRadialBasisFunctionKernelBase,
                SPDRadialBasisFunctionKernelBase );

  typedef TScalar ScalarType;

  bool IsCompactSupport() const
  { return true; }

protected:
  CSRadialBasisFunctionKernelBase() : Superclass() {}
  virtual ~CSRadialBasisFunctionKernelBase() {}

private:
  CSRadialBasisFunctionKernelBase( const Self& );
  void operator( const Self& );
};
}
#endif
