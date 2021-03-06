# hindent-show
[![Build Status](https://travis-ci.com/nwtgck/hindent-show.svg?branch=master)](https://travis-ci.com/nwtgck/hindent-show)

Pretty printing by hindent

## Install

Add this library to your `stack.yaml` like the following if you use [Stack](https://docs.haskellstack.org/en/stable/README/).

```yaml
...
extra-deps:
- git: https://github.com/nwtgck/hindent-show.git
  commit: 7b3c1fa21f7fac8f124361d1ab8fdaf0155a1445
...
```

Then, add `hindent-show` to your `package.yaml`.

```yaml
...
library:
 dependencies:
 - hindent-show
...
```


## Usage - pretty-print a data structure

Here is an example to pretty-print a tree.

```hs
data Tree a
  = Node { value :: a
         , left :: (Tree a)
         , right :: (Tree a) }
  | Leaf
  deriving (Show)


main :: IO
main = do
  let tree1 = Node 1 (Node 2 Leaf (Node 1 (Node 2 Leaf Leaf) Leaf)) (Node 1 (Node 2 Leaf Leaf) Leaf)
  hindentPrint tree1
```

### output

```txt
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
```

## Usage - indent of code

```hs
main :: IO ()
main = do
  let formated :: String
      formated = hidentFormat "a = [332521132,20783,30,4093902,1390,109301,93132,3901,83912,218491,284913]"
  putStrLn formated

``` 

### output

```
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
```
