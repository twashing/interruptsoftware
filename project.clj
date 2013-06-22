(defproject interruptsoftware "0.1.0-SNAPSHOT"
  :description "Company site for Interrupt Software."
  :url "http://interruptsoftware.ca"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [compojure "1.1.5"]
                 [ring/ring-core "1.2.0-beta1"
                  :exclusions [javax.servlet/servlet-api]]]

  :plugins [[lein-ring "0.8.5"]]
  :ring {:handler interruptsoftware.handler/app}
  :profiles
  {:dev { :resource-paths ["public/"]
          :dependencies [[ring-mock "0.1.5"]]}})
