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
#ifndef __itkRadialBasisFunctionKernelBase_h
#define __itkRadialBasisFunctionKernelBase_h

namespace itk
{
template< typename TScalar >
class RadialBasisFunctionKernelBase :
  public FunctionBase< TScalar, TScalar >
{
public:
  typedef RadialBasisFunctionKernelBase     Self;
  typedef SmartPointer< Self >              Pointer;
  typedef SmartPointer< const Self >        ConstPointer;
  typedef FunctionBase< TScalar, TScalar >  Superclass;

  /** Run-time type information (and related methods). */
  itkTypeMacro( RadialBasisFunctionKernelBase, FunctionBase );

  typedef TScalar ScalarType;

  virtual bool IsStrictlyDefinitePositive() const = 0;

  virtual bool IsCompactSupport() const = 0;

  virtual unsigned int GetOrder() const = 0;

  virtual ScalarType Evaluate( const ScalarType& iX ) const = 0;
  virtual ScalarType Derivative1( const ScalarType& iX ) { (void) iX; }
  virtual ScalarType Derivative2( const ScalarType& iX ) { (void) iX; }

  itkSetMacro( Scale, ScalarType );
  itkGetMacro( Scale, ScalarType );

protected:
  RadialBasisFunctionKernelBase() : Superclass(),
    m_Scale( NumericTraits< ScalarType >::One ) {}
  virtual ~RadialBasisFunctionKernelBase() {}

  ScalarType m_Scale;

private:
  RadialBasisFunctionKernelBase( const Self& );
  void operator( const Self& );
};
}
#endif
