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
#ifndef __itkCPDRadialBasisFunctionKernelBase_h
#define __itkCPDRadialBasisFunctionKernelBase_h

namespace itk
{
template< typename TScalar >
class CPDRadialBasisFunctionKernelBase :
  public RadialBasisFunctionKernelBase< TScalar >
{
public:
  typedef CPDRadialBasisFunctionKernelBase           Self;
  typedef SmartPointer< Self >                       Pointer;
  typedef SmartPointer< const Self >                 ConstPointer;
  typedef RadialBasisFunctionKernelBase< TScalar >   Superclass;

  /** Run-time type information (and related methods). */
  itkTypeMacro( CPDRadialBasisFunctionKernelBase,
                RadialBasisFunctionKernelBase );

  typedef typename Superclass::ScalarType ScalarType;

  bool IsStrictlyDefinitePositive() const
  { return false; }

  bool IsCompactSupport() const
  { return false; }

protected:
  CPDRadialBasisFunctionKernelBase() : Superclass() {}
  virtual ~CPDRadialBasisFunctionKernelBase() {}

private:
  CPDRadialBasisFunctionKernelBase( const Self& );
  void operator( const Self& );
};
}
#endif
