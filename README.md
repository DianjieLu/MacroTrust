# MacroTrust
SourceCode-Towards a Trust Ecosystem for Crowdsourcing IoT Services: A Macro Perspective

This project provides a comparison between theoretical and experimental results in trust networks with a Poisson degree distribution, as shown in Fig. 7 of our paper. It contains seven files, described as follows. 
1. sin_mean_size_barW5.m and sin_mean_size_barW8.m are used to compute the theoretical threshold (Eq. 39), as well as ⟨s⟩ₙ and ⟨s⟩ₒᵤₜ (Eq. 38). These theoretical results are then compared with data obtained from simulation experiments.
2. TIGC_fraction_barW5.m and TIGC_fraction_barW8.m compute the theoretical threshold, read the theoretically calculated fraction of the TIGC, and compare it with the fraction obtained from simulation statistics.
3. The archive TICG_FractionComputation.zip includes the C++ source code used for the theoretical computation of the TIGC fraction (Eq. 41).
4. dataTchange_W0.5.zip and dataTchange_W0.8.zip contain files for both the precomputed theoretical values and the numerical results obtained from simulations.
