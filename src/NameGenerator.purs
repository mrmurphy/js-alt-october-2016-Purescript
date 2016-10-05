module NameGenerator where

import Pux.Html as P
import Pux.Html.Attributes as PA
import Pux.Html.Events as PE

import Data.String (fromCharArray, toCharArray)
import Prelude (($), map)

data Action = NoOp | UpdateInput PE.FormEvent

type State = String

init :: String
init = ""

update :: Action -> State -> State
update NoOp state = state
update (UpdateInput ev) state = ev.target.value

view :: State -> P.Html Action
view state =
  P.div
    []
    [ P.h1 [] [ P.text "Hi, there!"]
    , P.input [ PA.type_ "text", PA.value state, PE.onChange UpdateInput] []
    , P.h2 [] [ P.text "Your Falltober name is:" ]
    , P.p [] [ P.text $ falltoberize state ]
    ]


falltoberize :: String -> String
falltoberize str =
  fromCharArray
  $ map (\char -> 'a')
  $ toCharArray str
