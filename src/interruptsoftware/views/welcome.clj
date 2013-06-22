(ns interruptsoftware.views.welcome
  (:require [interruptsoftware.views.common :as common]
            [noir.content.getting-started]
            [net.cgrand.enlive-html :as enlive])
  (:use [noir.core :only [defpage]]
        [hiccup.core :only [html]])
)

(defpage "/welcome" []
         (common/layout
           [:p "Welcome to Interrupt Software"]))

(defpage "/" []
  (let  [templ (enlive/html-resource "index.html")]
    (enlive/emit* templ)
  )
)

