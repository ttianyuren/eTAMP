(define (domain pr2-tamp)
  (:requirements :strips :equality :action-costs)
  (:types arm wuti grasp config pose trajectory)
  (:predicates

    (IsPose ?o - wuti ?p - pose)
    (IsGrasp ?o - wuti ?p1 - pose ?p2 - pose ?g - grasp ?a - arm)
    (IsArm ?a - arm ?o - wuti ?p1 - pose ?p2 - pose)

    (KinFrom ?o - wuti ?p - pose ?g - grasp ?a - arm ?t - trajectory)
    (KinTo ?o - wuti ?p - pose ?g - grasp ?a - arm ?t - trajectory)
    (On ?o - wuti ?r - wuti)

    (Graspable ?o - wuti)

    (AtGrasp ?o - wuti ?g - grasp ?a - arm)
    (AtPose ?o - wuti ?p - pose)

    (CanPick)
    (Smaller ?o - wuti ?r - wuti)
    (Clear ?r - wuti)
    (IsSupport ?o - wuti ?p - pose ?r - wuti ?rp - pose)

  )

  (:functions
      (total-cost) - number
  )


  (:action pick
    :parameters (?a - arm ?o - wuti ?p - pose ?g - grasp ?r - wuti ?t - trajectory)
    :precondition (and (AtPose ?o ?p)
                       (KinFrom ?o ?p ?g ?a ?t)
                       (On ?o ?r)
                       (Clear ?o)
                       (CanPick)
                       (Graspable ?o)
                       )
    :effect (and (increase (total-cost) 100)
                 (not (On ?o ?r))
                 (not (CanPick))
                 (AtGrasp ?o ?g ?a)
                 (not (AtPose ?o ?p))
                 (Clear ?r)
                 )
  )

  (:action place
    :parameters (?a - arm ?o - wuti ?p - pose ?g - grasp ?r - wuti ?rp - pose ?t - trajectory)
    :precondition (and (KinTo ?o ?p ?g ?a ?t)
                       (Smaller ?o ?r)
                       (Clear ?r)
                       (AtGrasp ?o ?g ?a)
                       (AtPose ?r ?rp)
                       (IsSupport ?o ?p ?r ?rp)
                       )
    :effect (and (increase (total-cost) 100)
                 (On ?o ?r)
                 (CanPick)
                 (not (AtGrasp ?o ?g ?a))
                 (AtPose ?o ?p)
                 (not (Clear ?r))
                 )
  )


)