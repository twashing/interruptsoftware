(ns interruptsoftware.handler
  (:use compojure.core)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]))

(defroutes app-routes
  (GET "/" [] "Hello World")

  ;; ======
  ;; Resource Routes
  (route/files "/")
  (route/resources "/")
  (route/not-found "Not Found"))

(def app
  (handler/site app-routes))
