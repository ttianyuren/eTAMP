(define (stream kuka-tamp)


  (:stream sample-place
    :inputs (?o - wuti ?r - wuti)
    :domain (Stackable ?o ?r)
    :outputs (?p - pose)
    :certified (and (IsPose ?o ?p) (IsSupport ?o ?p ?r))
  )
  (:stream sample-stack
    :inputs (?ou - wuti ?os - wuti ?ps - pose)
    :domain (and (IsPose ?os ?ps) (Stackable ?ou ?os))
    :outputs (?pu - pose)
    :certified (and (IsPose ?ou ?pu) (IsStackSupport ?ou ?pu ?os ?ps))
  )

  (:stream sample-grasp-dir
    :inputs (?o - wuti ?p - pose)
    :domain (and (Graspable ?o) (isPose ?o ?p))
    :outputs (?dg - grasp_dir)
    :certified (IsGraspDir ?o ?p ?dg)
  )

  (:stream sample-grasp
    :inputs (?o - wuti ?p - pose ?dg - grasp_dir)
    :domain (IsGraspDir ?o ?p ?dg)
    :outputs (?g - grasp)
    :certified (and (GraspAtPose ?g ?p) (IsGrasp ?o ?g))
  )

  (:stream inverse-kinematics
    :inputs (?o - wuti ?p - pose ?g - grasp)
    :domain (and (IsPose ?o ?p) (IsGrasp ?o ?g))
    :outputs (?q - config ?t - trajectory)
    :certified (and (IsConf ?q) (IsTraj ?t) (IsKin ?o ?p ?g ?q ?t))
  )
  (:stream plan-free-motion
    :inputs (?q1 - config ?q2 - config)
    :domain (and (IsConf ?q1) (IsConf ?q2))
    :fluents (AtPose)
    :outputs (?t - trajectory)
    :certified (IsFreeMotion ?q1 ?t ?q2)
  )
  (:stream plan-holding-motion
    :inputs (?q1 - config ?q2 - config ?o - wuti ?g - grasp)
    :domain (and (IsConf ?q1) (IsConf ?q2) (IsGrasp ?o ?g))
    :fluents (AtPose)
    :outputs (?t - trajectory)
    :certified (IsHoldingMotion ?q1 ?t ?q2 ?o ?g)
  )

)