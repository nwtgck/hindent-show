{-# LANGUAGE QuasiQuotes #-}

module HIndentShowSpec where

import           Test.Hspec
import           Test.Hspec.QuickCheck
import           Test.QuickCheck

import qualified Data.String.Here as Here
import           HIndentShow

main :: IO ()
main = hspec spec

data Tree a
  = Node { value :: a
         , left :: (Tree a)
         , right :: (Tree a) }
  | Leaf
  deriving (Show)

spec :: Spec
spec = do
  describe "hindentShow" $ do
    it "simple tree" $ do
      let tree1 = Node 1 (Node 2 Leaf (Node 1 (Node 2 Leaf Leaf) Leaf)) (Node 1 (Node 2 Leaf Leaf) Leaf)
      let actual = hindentShow tree1
      let expect = [Here.here|
Node
{ value = 1
, left =
    Node
    { value = 2
    , left = Leaf
    , right =
        Node
        { value = 1
        , left = Node {value = 2, left = Leaf, right = Leaf}
        , right = Leaf
        }
    }
, right =
    Node
    { value = 1
    , left = Node {value = 2, left = Leaf, right = Leaf}
    , right = Leaf
    }
}
|] ++ "\n"
      actual `shouldBe` expect

  describe "hidentFormat" $ do
    it "simple tree" $ do
      let tree1 = Node 1 (Node 2 Leaf (Node 1 (Node 2 Leaf Leaf) Leaf)) (Node 1 (Node 2 Leaf Leaf) Leaf)
      let actual = hidentFormat "a = [332521132,20783,30,4093902,1390,109301,93132,3901,83912,218491,284913]"
      let expect = [Here.here|
a =
  [ 332521132
  , 20783
  , 30
  , 4093902
  , 1390
  , 109301
  , 93132
  , 3901
  , 83912
  , 218491
  , 284913
  ]
|] ++ "\n"
      actual `shouldBe` expect
