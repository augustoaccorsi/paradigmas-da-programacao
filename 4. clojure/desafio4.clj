(ns tst.xyz.core
  (:use clojure.test)
  (:require [clojure.string :as str] ))

(defn tails [x]
  (concat (take-while seq (iterate rest x)) '(())))

(println (tails (range 3)))

(defn inits [a-seq]
  (reverse (map reverse (tails (reverse a-seq)))))

(defn rotations [a-seq]
  (distinct (map concat (tails a-seq) (inits a-seq))))

(println (rotations (range 3)))

(defn anagram [a-set]
  (if (empty? a-set)
    (list ())
    (apply concat (map (fn [x] (map cons (repeat (first x))
                                         (anagram (rest x))))
                  (rotations a-set)))))

(println (anagram (to-array "abcde")))

(defn check-password [attempt]
  (let [password "abcde"]
  (if (str/starts-with? password attempt) (println "senha ok") (println "senha não ok"))))

(check-password "a")
(check-password "ab")
(check-password "abc")
(check-password "abcd")
(check-password "abcdh")
