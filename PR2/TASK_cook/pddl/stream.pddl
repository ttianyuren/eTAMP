(define (stream pr2-tamp)
  (:stream sample-place
    :inputs (?o - wuti ?r - wuti)
    :domain (Stackable ?o ?r)
    :outputs (?p - pose)
    :certified (and (IsPose ?o ?p) (Supported ?o ?p ?r))
  )
  (:stream sample-grasp
    :inputs (?o - wuti)
    :domain (Graspable ?o)
    :outputs (?g - grasp)
    :certified (IsGrasp ?o ?g)
  )
  (:stream inverse-kinematics
    :inputs (?a - arm ?o - wuti ?p - pose ?g - grasp)
    :domain (and (Controllable ?a) (IsPose ?o ?p) (IsGrasp ?o ?g))
    :outputs (?q - config ?t - trajectory)
    :certified (and (IsBConf ?q) (Kin ?a ?o ?p ?g ?q ?t))
  )
  (:stream plan-base-motion
    :inputs (?q1 - config ?q2 - config)
    :domain (and (IsBConf ?q1) (IsBConf ?q2))
    :outputs (?t - trajectory)
    :certified (BaseMotion ?q1 ?t ?q2)
  )

)