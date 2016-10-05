module Main where

import Prelude
import NameGenerator (update, view, init)

import Pux (renderToDOM, fromSimple, start)

main :: _
main = do
  app <- start
    { initialState: init
    , update: fromSimple update
    , view: view
    , inputs: []
    }

  renderToDOM "#app" app.html
