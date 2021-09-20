;09:54:51 10/09

(define (domain pr2-tamp)
   (:requirements :strips :equality :action-costs)

   (:types
          arm wuti grasp config pose trajectory
   )

   (:constants
   )

   (:predicates
          (isarm ?a - arm)
          (controllable ?a - arm)
          (stackable ?o - wuti ?r - wuti)
          (sink ?r - wuti)
          (stove ?r - wuti)
          (ispose ?o - wuti ?p - pose)
          (isgrasp ?o - wuti ?g - grasp)
          (kin ?a - arm ?o - wuti ?p - pose ?g - grasp ?q - config ?t - trajectory)
          (basemotion ?q1 - config ?t - trajectory ?q2 - config)
          (supported ?o - wuti ?p - pose ?r - wuti)
          (atpose ?o - wuti ?p - pose)
          (atgrasp ?a - arm ?o - wuti ?g - grasp)
          (graspable ?o - wuti)
          (handempty ?a - arm)
          (atbconf ?q - config)
          (isbconf ?q - config)
          (canmove)
          (cleaned ?o - wuti)
          (cooked ?o - wuti)
          (canoperate)
          (on ?o - wuti ?r - wuti)
          (holding ?a - arm ?o - wuti)
   )

   (:functions
          (total-cost) - number
   )

   (:derived (on ?o - wuti ?r - wuti)
          (exists (?p) (and (supported ?o ?p ?r) (atpose ?o ?p)))
   )
   (:derived (holding ?a - arm ?o - wuti)
          (exists (?g) (and (isarm ?a) (isgrasp ?o ?g) (atgrasp ?a ?o ?g)))
   )

   (:action move_base
          :parameters (?q1 - config ?q2 - config ?t - trajectory)
          :precondition (and (basemotion ?q1 ?t ?q2) (atbconf ?q1) (canmove))
          :effect (and (atbconf ?q2) (not (atbconf ?q1)) (not (canmove)) (increase (total-cost) 200) (not (canoperate)))
   )
   (:action pick
          :parameters (?a - arm ?o - wuti ?p - pose ?g - grasp ?q - config ?t - trajectory)
          :precondition (and (kin ?a ?o ?p ?g ?q ?t) (atpose ?o ?p) (handempty ?a) (atbconf ?q))
          :effect (and (atgrasp ?a ?o ?g) (canmove) (not (atpose ?o ?p)) (not (handempty ?a)) (increase (total-cost) 100) (not (canoperate)))
   )
   (:action place
          :parameters (?a - arm ?o - wuti ?p - pose ?g - grasp ?q - config ?t - trajectory)
          :precondition (and (kin ?a ?o ?p ?g ?q ?t) (atgrasp ?a ?o ?g) (atbconf ?q))
          :effect (and (atpose ?o ?p) (handempty ?a) (canmove) (not (atgrasp ?a ?o ?g)) (increase (total-cost) 100) (canoperate))
   )
   (:action clean
          :parameters (?o - wuti ?r - wuti)
          :precondition (and (stackable ?o ?r) (sink ?r) (on ?o ?r) (canoperate))
          :effect (and (cleaned ?o) (increase (total-cost) 50) (not (canoperate)))
   )
   (:action cook
          :parameters (?o - wuti ?r - wuti)
          :precondition (and (stackable ?o ?r) (stove ?r) (on ?o ?r) (cleaned ?o) (canoperate))
          :effect (and (cooked ?o) (not (cleaned ?o)) (increase (total-cost) 50) (not (canoperate)))
   )
)
