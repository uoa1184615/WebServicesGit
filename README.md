WebServicesGit
==============

Source code for using computer algebra package Reduce to
construct emergent models of complex dynamical systems.

InvariantManifold: provides a Reduce procedure to construct
a specified invariant manifold for a specified system of
ordinary differential equations or delay differential
equations. The invariant manifold may be any of a centre
manifold, a slow manifold, an un/stable manifold, a
sub-centre manifold, a nonlinear normal form, any spectral
submanifold, or indeed a normal form coordinate transform of
the entire state space.

StochasticNormalForm: derive a stochastic/non-autonomous
coordinate transformation that separates slow, stable and
unstable modes in a system of SDEs or non-autonomous ODEs
(or autonomous ODEs).  This coordinate transform immediately
gives the reduced model on the stochastic/non-autonomous
slow manifold (and also other invariant manifolds), and the
corresponding stochastic/non-autonomous isochrons which are
so useful for projecting initial conditions and uncertainty
quantification.

CentreManifold: replaced by InvariantManifold.  This code
used to provide the web service that does no longer exist
but was at
http://www.maths.adelaide.edu.au/anthony.roberts/gencm.php