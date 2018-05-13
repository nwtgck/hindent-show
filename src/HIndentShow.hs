module HIndentShow where

import qualified Data.ByteString as S
import qualified Data.ByteString.Builder as S
import qualified Data.ByteString.Lazy.Char8 as L8
import           HIndent
import           HIndent.Types
import           Language.Haskell.Exts.Extension (Extension)

-- | Format string via hident
hidentFormat :: Config -> Maybe [Extension] -> String -> String
hidentFormat config extsMay str =
  (either (const str) (L8.unpack . S.toLazyByteString) . reformat config extsMay Nothing . L8.toStrict . L8.pack) str

-- | Show by hindent with some options
hindentShowWithConfigAndExts :: Show a => Config -> Maybe [Extension] -> a -> String
hindentShowWithConfigAndExts config extsMay x =
  hidentFormat config extsMay (show x)

-- | Show by hindent
hindentShow :: Show a => a -> String
hindentShow x =
  hindentShowWithConfigAndExts defaultConfig (Just defaultExtensions) x

-- | Print by hindent 
hindentPrint :: Show a => a -> IO ()
hindentPrint = putStrLn . hindentShow
