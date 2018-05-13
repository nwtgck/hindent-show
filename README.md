# hindent-show
[![Build Status](https://travis-ci.com/nwtgck/hindent-show.svg?branch=master)](https://travis-ci.com/nwtgck/hindent-show)

Pretty printing by hindent

## Install

Add this library to your `stack.yaml` like the following if you use [Stack](https://docs.haskellstack.org/en/stable/README/).

```yaml
...
extra-deps:
- git: https://github.com/nwtgck/hindent-show.git
  commit: 0275850f8021823f061f1948cef5ff5f0f47952c
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


## Usage

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
