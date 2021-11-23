;09:27:57 01/10

(define (domain pr2-tamp)
   (:requirements :strips :equality :action-costs)

   (:types
          arm wuti grasp config pose trajectory
   )

   (:constants
   )

   (:predicates
          (ispose ?o - wuti ?p - pose)
          (isgrasp ?o - wuti ?p1 - pose ?p2 - pose ?g - grasp ?a - arm)
          (isarm ?a - arm ?o - wuti ?p1 - pose ?p2 - pose)
          (kinfrom ?o - wuti ?p - pose ?g - grasp ?a - arm ?t - trajectory)
          (kinto ?o - wuti ?p - pose ?g - grasp ?a - arm ?t - trajectory)
          (on ?o - wuti ?r - wuti)
          (graspable ?o - wuti)
          (atgrasp ?o - wuti ?g - grasp ?a - arm)
          (atpose ?o - wuti ?p - pose)
          (canpick)
          (smaller ?o - wuti ?r - wuti)
          (clear ?r - wuti)
          (issupport ?o - wuti ?p - pose ?r - wuti ?rp - pose)
   )

   (:functions
          (total-cost) - number
   )


   (:action pick
          :parameters (?a - arm ?o - wuti ?p - pose ?g - grasp ?r - wuti ?t - trajectory)
          :precondition (and (atpose ?o ?p) (kinfrom ?o ?p ?g ?a ?t) (on ?o ?r) (clear ?o) (canpick) (graspable ?o))
          :effect (and (increase (total-cost) 100) (not (on ?o ?r)) (not (canpick)) (atgrasp ?o ?g ?a) (not (atpose ?o ?p)) (clear ?r))
   )
   (:action place
          :parameters (?a - arm ?o - wuti ?p - pose ?g - grasp ?r - wuti ?rp - pose ?t - trajectory)
          :precondition (and (kinto ?o ?p ?g ?a ?t) (smaller ?o ?r) (clear ?r) (atgrasp ?o ?g ?a) (atpose ?r ?rp) (issupport ?o ?p ?r ?rp))
          :effect (and (increase (total-cost) 100) (on ?o ?r) (canpick) (not (atgrasp ?o ?g ?a)) (atpose ?o ?p) (not (clear ?r)))
   )
)
