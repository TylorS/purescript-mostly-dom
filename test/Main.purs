module Test.Main where

import Control.Monad.Eff (Eff)
import MostlyDom.Hyperscript (Property(..), VNode, div, text)
import Prelude (($), Unit)
import Test.Spec (SpecEffects, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Mocha (MOCHA, runMocha)

main :: Eff (SpecEffects (mocha :: MOCHA)) Unit
main = runMocha do
  describe "your feature" do
    it "works" $ shouldEqual (renderDiv "foo") (renderDiv "foo")

renderDiv :: String -> VNode
renderDiv className =
  div
    [ ClassName className
    , Attr "data-something" "asdf"
    ]
    [ text "Hello, World"
    ]

