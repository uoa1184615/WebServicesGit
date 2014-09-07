WebServicesGit
==============

Source code for using Reduce to construct emergent models of
complex dynamical systems.

CentreManifold: obtain a centre manifold of your specified
system of ordinary differential equations (ODE) or delay
differential equations (DDE), when the ODE/DDE has fast and
centre modes.  This code underlies the web service at
http://www.maths.adelaide.edu.au/anthony.roberts/gencm.php

StochasticNormalForm: derive a stochastic/non-autonomous
coordinate transformation that separates slow, stable and
unstable modes in a system of SDEs or non-autonomous ODEs
(or autonomous ODEs).  This coordinate transform immediately
gives the reduced model on the stochastic/non-autonomous
slow manifold (and also other invariant manifolds), and the
corresponding stochastic/non-autonomous isochrons which are
so useful for projecting initial conditions and uncertainty
quantification.