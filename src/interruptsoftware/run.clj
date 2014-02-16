(ns interruptsoftware.run
  (:require [ring.adapter.jetty :refer :all]))

(defn run []
  (defonce server
    (run-jetty #'interruptsoftware.handler/app {:port 8080 :join? false})))
