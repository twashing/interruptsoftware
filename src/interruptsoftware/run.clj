(ns interruptsoftware.run
  (:require [ring.adapter.jetty :refer :all]
            [interruptsoftware.handler :refer [app]]))

(defn run
  ([] (run 8080))
  ([port]
   (defonce server
     (run-jetty #'app {:port port :join? false}))))

(defn -main [& args]
  (if-let [port (second args)]
    (run (Integer. port))
    (run 80)))
