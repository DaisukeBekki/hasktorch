{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}

module Torch.GraduallyTyped.DType where

import Data.Kind (Type)
import Torch.DType (DType (..))
import Type.Errors.Pretty (TypeError, type (%), type (<>))

data DataType (dType :: Type) where
  AnyDataType :: forall dType. DataType dType
  DataType :: forall dType. dType -> DataType dType
  deriving (Show)

class KnownDataType (dataType :: DataType DType) where
  dataTypeVal :: DataType DType

instance KnownDataType 'AnyDataType where
  dataTypeVal = AnyDataType

instance KnownDataType ( 'DataType 'Bool) where
  dataTypeVal = DataType Bool

instance KnownDataType ( 'DataType 'UInt8) where
  dataTypeVal = DataType UInt8

instance KnownDataType ( 'DataType 'Int8) where
  dataTypeVal = DataType Int8

instance KnownDataType ( 'DataType 'Int16) where
  dataTypeVal = DataType Int16

instance KnownDataType ( 'DataType 'Int32) where
  dataTypeVal = DataType Int32

instance KnownDataType ( 'DataType 'Int64) where
  dataTypeVal = DataType Int64

instance KnownDataType ( 'DataType 'Half) where
  dataTypeVal = DataType Half

instance KnownDataType ( 'DataType 'Float) where
  dataTypeVal = DataType Float

instance KnownDataType ( 'DataType 'Double) where
  dataTypeVal = DataType Double

class WithDataTypeC (isAnyDataType :: Bool) (dataType :: DataType DType) (f :: Type) where
  type WithDataTypeF isAnyDataType f :: Type
  withDataType :: (DType -> f) -> WithDataTypeF isAnyDataType f

instance WithDataTypeC 'True dataType f where
  type WithDataTypeF 'True f = DType -> f
  withDataType = id

instance (KnownDataType dataType) => WithDataTypeC 'False dataType f where
  type WithDataTypeF 'False f = f
  withDataType f = case dataTypeVal @dataType of DataType dataType -> f dataType

type family UnifyDataTypeF (dataType :: DataType DType) (dataType' :: DataType DType) :: DataType DType where
  UnifyDataTypeF 'AnyDataType 'AnyDataType = 'AnyDataType
  UnifyDataTypeF ( 'DataType _) 'AnyDataType = 'AnyDataType
  UnifyDataTypeF 'AnyDataType ( 'DataType _) = 'AnyDataType
  UnifyDataTypeF ( 'DataType dType) ( 'DataType dType) = 'DataType dType
  UnifyDataTypeF ( 'DataType dType) ( 'DataType dType') =
    TypeError
      ( "The supplied tensors must have the same data type, "
          % "but different data types were found:"
          % ""
          % "    " <> dType <> " and " <> dType' <> "."
          % ""
      )