(define (domain pick-and-place)
   (:requirements :typing :strips :equality)

   (:types
          wuti grasp_dir grasp config pose trajectory
   )

   (:constants
          #o20 #o8 #o26 - grasp_dir
          #o27 #o21 #o9 - grasp
          #o41 #o22 #o37 #o45 #o10 #o28 - config
          #o23 #o42 #o29 #o49 #o44 #o50 #o51 #o11 #o46 #o47 #o36 #o38 #o48 - trajectory
          #o18 #o12 #o31 - pose
   )

   (:predicates
          (issink ?r - wuti)
          (isstove ?r - wuti)
          (fixed ?r - wuti)
          (graspable ?o - wuti)
          (isgraspdir ?o - wuti ?dg - grasp_dir)
          (stackable ?o - wuti ?r - wuti)
          (ispose ?o - wuti ?p - pose)
          (isconf ?q - config)
          (istraj ?t - trajectory)
          (isgrasp ?o - wuti ?g - grasp)
          (iskin ?o - wuti ?p - pose ?g - grasp ?q - config ?t - trajectory)
          (isfreemotion ?q1 - config ?t - trajectory ?q2 - config)
          (isholdingmotion ?q1 - config ?t - trajectory ?q2 - config ?o - wuti ?g - grasp)
          (trajcollision ?t - trajectory ?o2 - wuti ?p2 - pose)
          (issupport ?o - wuti ?p - pose ?r - wuti)
          (isstacksupport ?ou - wuti ?pu - pose ?os - wuti ?ps - pose)
          (atpose ?o - wuti ?p - pose)
          (atgrasp ?o - wuti ?g - grasp)
          (handempty)
          (atconf ?q - config)
          (canmove)
          (cleaned ?o - wuti)
          (cooked ?o - wuti)
          (on ?o - wuti ?r - wuti)
          (occupied ?o - wuti)
          (holding ?o - wuti)
          (unsafetraj ?t - trajectory)
   )

   (:derived (on ?ou - wuti ?os - wuti)
          (or (exists (?pu) (and (issupport ?ou ?pu ?os) (atpose ?ou ?pu))) (exists (?pu ?ps) (and (isstacksupport ?ou ?pu ?os ?ps) (atpose ?ou ?pu) (atpose ?os ?ps))))
   )
   (:derived (occupied ?os - wuti)
          (exists (?ou) (on ?ou ?os))
   )
   (:derived (holding ?o - wuti)
          (exists (?g) (and (isgrasp ?o ?g) (atgrasp ?o ?g)))
   )

   (:action move_free
          :parameters (?q1 - config ?q2 - config ?t - trajectory)
          :precondition (and (isfreemotion ?q1 ?t ?q2) (atconf ?q1) (handempty) (canmove) (not (unsafetraj ?t)))
          :effect (and (atconf ?q2) (not (atconf ?q1)) (not (canmove)) (not (isfreemotion ?q1 ?t ?q2)))
   )
   (:action move_holding
          :parameters (?q1 - config ?q2 - config ?o - wuti ?g - grasp ?t - trajectory)
          :precondition (and (isholdingmotion ?q1 ?t ?q2 ?o ?g) (atconf ?q1) (atgrasp ?o ?g) (canmove) (not (unsafetraj ?t)))
          :effect (and (atconf ?q2) (not (atconf ?q1)) (not (canmove)) (not (isholdingmotion ?q1 ?t ?q2 ?o ?g)))
   )
   (:action pick
          :parameters (?o - wuti ?p - pose ?g - grasp ?q - config ?t - trajectory)
          :precondition (and (iskin ?o ?p ?g ?q ?t) (atpose ?o ?p) (handempty) (atconf ?q) (not (unsafetraj ?t)))
          :effect (and (atgrasp ?o ?g) (canmove) (not (atpose ?o ?p)) (not (handempty)) (not (iskin ?o ?p ?g ?q ?t)))
   )
   (:action place
          :parameters (?o - wuti ?p - pose ?r - wuti ?g - grasp ?q - config ?t - trajectory)
          :precondition (and (iskin ?o ?p ?g ?q ?t) (issupport ?o ?p ?r) (atgrasp ?o ?g) (atconf ?q) (graspable ?o) (fixed ?r) (not (unsafetraj ?t)))
          :effect (and (atpose ?o ?p) (handempty) (canmove) (not (atgrasp ?o ?g)) (not (iskin ?o ?p ?g ?q ?t)))
   )
   (:action stack
          :parameters (?ou - wuti ?pu - pose ?os - wuti ?ps - pose ?g - grasp ?q - config ?t - trajectory)
          :precondition (and (atpose ?os ?ps) (isstacksupport ?ou ?pu ?os ?ps) (iskin ?ou ?pu ?g ?q ?t) (atgrasp ?ou ?g) (atconf ?q) (graspable ?ou) (graspable ?os) (not (unsafetraj ?t)))
          :effect (and (atpose ?ou ?pu) (handempty) (canmove) (not (atgrasp ?o ?g)))
   )
   (:action clean
          :parameters (?o - wuti ?r - wuti)
          :precondition (and (stackable ?o ?r) (issink ?r) (on ?o ?r))
          :effect (and (cleaned ?o))
   )
   (:action cook
          :parameters (?o - wuti ?r - wuti)
          :precondition (and (stackable ?o ?r) (isstove ?r) (on ?o ?r) (cleaned ?o))
          :effect (and (cooked ?o) (not (cleaned ?o)))
   )
   (:action s0_sample-grasp-dir
          :parameters (v9)
          :precondition (graspable v9)
          :effect (isgraspdir v9 #o8)
   )
   (:action s1_sample-grasp
          :parameters (v9 #o8)
          :precondition (and (graspable v9) (isgraspdir v9 #o8))
          :effect (isgrasp v9 #o9)
   )
   (:action s2_inverse-kinematics
          :parameters (v9 v10 #o9)
          :precondition (and (ispose v9 v10) (isgrasp v9 #o9))
          :effect (and (isconf #o10) (istraj #o11) (iskin v9 v10 #o9 #o10 #o11))
   )
   (:action s3_sample-place
          :parameters (v1 v4)
          :precondition (stackable v1 v4)
          :effect (and (ispose v1 #o31) (issupport v1 #o31 v4))
   )
   (:action s4_sample-grasp-dir
          :parameters (v1)
          :precondition (graspable v1)
          :effect (isgraspdir v1 #o26)
   )
   (:action s5_sample-grasp
          :parameters (v1 #o26)
          :precondition (and (graspable v1) (isgraspdir v1 #o26))
          :effect (isgrasp v1 #o27)
   )
   (:action s6_inverse-kinematics
          :parameters (v1 #o31 #o27)
          :precondition (and (ispose v1 #o31) (isgrasp v1 #o27))
          :effect (and (isconf #o41) (istraj #o42) (iskin v1 #o31 #o27 #o41 #o42))
   )
   (:action s7_sample-grasp-dir
          :parameters (v7)
          :precondition (graspable v7)
          :effect (isgraspdir v7 #o20)
   )
   (:action s8_sample-grasp
          :parameters (v7 #o20)
          :precondition (and (graspable v7) (isgraspdir v7 #o20))
          :effect (isgrasp v7 #o21)
   )
   (:action s9_inverse-kinematics
          :parameters (v7 v8 #o21)
          :precondition (and (ispose v7 v8) (isgrasp v7 #o21))
          :effect (and (isconf #o37) (istraj #o38) (iskin v7 v8 #o21 #o37 #o38))
   )
   (:action s10_plan-free-motion
          :parameters (#o41 #o37)
          :precondition (and (isconf #o41) (isconf #o37))
          :effect (isfreemotion #o41 #o44 #o37)
   )
   (:action s11_sample-place
          :parameters (v7 v4)
          :precondition (stackable v7 v4)
          :effect (and (ispose v7 #o12) (issupport v7 #o12 v4))
   )
   (:action s12_inverse-kinematics
          :parameters (v7 #o12 #o21)
          :precondition (and (ispose v7 #o12) (isgrasp v7 #o21))
          :effect (and (isconf #o22) (istraj #o23) (iskin v7 #o12 #o21 #o22 #o23))
   )
   (:action s13_sample-place
          :parameters (v9 v4)
          :precondition (stackable v9 v4)
          :effect (and (ispose v9 #o18) (issupport v9 #o18 v4))
   )
   (:action s14_inverse-kinematics
          :parameters (v9 #o18 #o9)
          :precondition (and (ispose v9 #o18) (isgrasp v9 #o9))
          :effect (and (isconf #o45) (istraj #o46) (iskin v9 #o18 #o9 #o45 #o46))
   )
   (:action s15_plan-free-motion
          :parameters (#o45 v0)
          :precondition (and (isconf #o45) (isconf v0))
          :effect (isfreemotion #o45 #o47 v0)
   )
   (:action s16_inverse-kinematics
          :parameters (v1 v2 #o27)
          :precondition (and (ispose v1 v2) (isgrasp v1 #o27))
          :effect (and (isconf #o28) (istraj #o29) (iskin v1 v2 #o27 #o28 #o29))
   )
   (:action s17_plan-holding-motion
          :parameters (#o28 #o41 v1 #o27)
          :precondition (and (isconf #o28) (isconf #o41) (isgrasp v1 #o27))
          :effect (isholdingmotion #o28 #o48 #o41 v1 #o27)
   )
   (:action s18_plan-holding-motion
          :parameters (#o10 #o45 v9 #o9)
          :precondition (and (isconf #o10) (isconf #o45) (isgrasp v9 #o9))
          :effect (isholdingmotion #o10 #o49 #o45 v9 #o9)
   )
   (:action s19_plan-free-motion
          :parameters (#o22 #o10)
          :precondition (and (isconf #o22) (isconf #o10))
          :effect (isfreemotion #o22 #o50 #o10)
   )
   (:action s20_plan-holding-motion
          :parameters (#o37 #o22 v7 #o21)
          :precondition (and (isconf #o37) (isconf #o22) (isgrasp v7 #o21))
          :effect (isholdingmotion #o37 #o51 #o22 v7 #o21)
   )
   (:action s21_plan-free-motion
          :parameters (v0 #o28)
          :precondition (and (isconf v0) (isconf #o28))
          :effect (isfreemotion v0 #o36 #o28)
   )
)
