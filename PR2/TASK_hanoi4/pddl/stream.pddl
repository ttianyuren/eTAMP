(define (stream pr2-tamp)

  (:stream sample-place
    :inputs (?o - wuti ?r - wuti ?rp - pose)
    :domain (and (Smaller ?o ?r) (Graspable ?o) (IsPose ?r ?rp))
    :outputs (?p - pose)
    :certified (and (IsPose ?o ?p) (IsSupport ?o ?p ?r ?rp))
  )

  (:stream sample-arm
    :inputs (?o - wuti ?p1 - pose ?p2 - pose)
    :domain (and (Graspable ?o) (IsPose ?o ?p1) (IsPose ?o ?p2))
    :outputs (?a - arm)
    :certified (and (IsArm ?a ?o ?p1 ?p2))
  )

  (:stream sample-grasp
    :inputs (?o - wuti ?p1 - pose ?p2 - pose ?a - arm)
    :domain (IsArm ?a ?o ?p1 ?p2)
    :outputs (?g - grasp)
    :certified (and (IsGrasp ?o ?p1 ?p2 ?g ?a))
  )

  (:stream ik-arm-motion-from
    :inputs (?o - wuti ?p1 - pose ?p2 - pose ?g - grasp ?a - arm)
    :domain (and (IsGrasp ?o ?p1 ?p2 ?g ?a))
    :outputs (?t - trajectory)
    :certified (KinFrom ?o ?p1 ?g ?a ?t)
  )

  (:stream ik-arm-motion-to
    :inputs (?o - wuti ?p2 - pose ?p1 - pose ?g - grasp ?a - arm)
    :domain (and (IsGrasp ?o ?p1 ?p2 ?g ?a))
    :outputs (?t - trajectory)
    :certified (KinTo ?o ?p2 ?g ?a ?t)
  )

)