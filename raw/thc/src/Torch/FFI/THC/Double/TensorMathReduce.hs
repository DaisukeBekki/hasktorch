{-# LANGUAGE ForeignFunctionInterface #-}
module Torch.FFI.THC.Double.TensorMathReduce where

import Foreign
import Foreign.C.Types
import Torch.Types.THC
import Data.Word
import Data.Int

-- | c_renorm :  state self src value dimension max_norm -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_renorm"
  c_renorm :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CDouble -> CInt -> CDouble -> IO ()

-- | c_std :  state self src dim biased keepdim -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_std"
  c_std :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> CInt -> IO ()

-- | c_norm :  state self src value dimension keepdim -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_norm"
  c_norm :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CDouble -> CInt -> CInt -> IO ()

-- | c_var :  state self src dim biased keepdim -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_var"
  c_var :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> CInt -> IO ()

-- | c_stdall :  state self biased -> accreal
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_stdall"
  c_stdall :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> CInt -> IO CDouble

-- | c_normall :  state self value -> accreal
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_normall"
  c_normall :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> CDouble -> IO CDouble

-- | c_varall :  state self biased -> accreal
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_varall"
  c_varall :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> CInt -> IO CDouble

-- | c_sum :  state self src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_sum"
  c_sum :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ()

-- | c_prod :  state self src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_prod"
  c_prod :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ()

-- | c_mean :  state self src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_mean"
  c_mean :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ()

-- | c_sumall :  state self -> accreal
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_sumall"
  c_sumall :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble

-- | c_prodall :  state self -> accreal
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_prodall"
  c_prodall :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble

-- | c_meanall :  state self -> accreal
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_meanall"
  c_meanall :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble

-- | c_min :  state values indices src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_min"
  c_min :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ()

-- | c_max :  state values indices src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_max"
  c_max :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ()

-- | c_minall :  state self -> real
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_minall"
  c_minall :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble

-- | c_maxall :  state self -> real
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_maxall"
  c_maxall :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble

-- | c_medianall :  state self -> real
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_medianall"
  c_medianall :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble

-- | c_median :  state values indices src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_median"
  c_median :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ()

-- | c_dist :  state self src value -> accreal
foreign import ccall "THCTensorMathReduce.h THCDoubleTensor_dist"
  c_dist :: Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CDouble -> IO CDouble

-- | p_renorm : Pointer to function : state self src value dimension max_norm -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_renorm"
  p_renorm :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CDouble -> CInt -> CDouble -> IO ())

-- | p_std : Pointer to function : state self src dim biased keepdim -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_std"
  p_std :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> CInt -> IO ())

-- | p_norm : Pointer to function : state self src value dimension keepdim -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_norm"
  p_norm :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CDouble -> CInt -> CInt -> IO ())

-- | p_var : Pointer to function : state self src dim biased keepdim -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_var"
  p_var :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> CInt -> IO ())

-- | p_stdall : Pointer to function : state self biased -> accreal
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_stdall"
  p_stdall :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> CInt -> IO CDouble)

-- | p_normall : Pointer to function : state self value -> accreal
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_normall"
  p_normall :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> CDouble -> IO CDouble)

-- | p_varall : Pointer to function : state self biased -> accreal
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_varall"
  p_varall :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> CInt -> IO CDouble)

-- | p_sum : Pointer to function : state self src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_sum"
  p_sum :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ())

-- | p_prod : Pointer to function : state self src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_prod"
  p_prod :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ())

-- | p_mean : Pointer to function : state self src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_mean"
  p_mean :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ())

-- | p_sumall : Pointer to function : state self -> accreal
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_sumall"
  p_sumall :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble)

-- | p_prodall : Pointer to function : state self -> accreal
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_prodall"
  p_prodall :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble)

-- | p_meanall : Pointer to function : state self -> accreal
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_meanall"
  p_meanall :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble)

-- | p_min : Pointer to function : state values indices src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_min"
  p_min :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ())

-- | p_max : Pointer to function : state values indices src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_max"
  p_max :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ())

-- | p_minall : Pointer to function : state self -> real
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_minall"
  p_minall :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble)

-- | p_maxall : Pointer to function : state self -> real
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_maxall"
  p_maxall :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble)

-- | p_medianall : Pointer to function : state self -> real
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_medianall"
  p_medianall :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> IO CDouble)

-- | p_median : Pointer to function : state values indices src dim keepdim -> void
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_median"
  p_median :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaLongTensor -> Ptr C'THCudaDoubleTensor -> CInt -> CInt -> IO ())

-- | p_dist : Pointer to function : state self src value -> accreal
foreign import ccall "THCTensorMathReduce.h &THCDoubleTensor_dist"
  p_dist :: FunPtr (Ptr C'THCState -> Ptr C'THCudaDoubleTensor -> Ptr C'THCudaDoubleTensor -> CDouble -> IO CDouble)