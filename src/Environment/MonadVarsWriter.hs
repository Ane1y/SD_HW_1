module Environment.MonadVarsWriter (
    module Environment.MonadVarPathWriter,
    module Environment.MonadVarPwdWriter,
    MonadVarsWriter,
    setVar,
    setVarPathDefault,
    setVarPwdDefault,
  ) where

import Environment.MonadVarPathWriter
import Environment.MonadVarPwdWriter

import Environment.MonadFS.Internal (AbsFilePath(..))

class (MonadVarPathWriter m, MonadVarPwdWriter m) => MonadVarsWriter m where
  setVar :: String -> String -> m ()

setVarPathDefault :: MonadVarsWriter m => [AbsFilePath] -> m ()
setVarPathDefault = setVar "PATH" . formatVarPath

setVarPwdDefault :: MonadVarsWriter m => AbsFilePath -> m ()
setVarPwdDefault = setVar "PWD" . asFilePath
