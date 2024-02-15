# CE_local_Adaptation
Code & publikations, data for the computational ecology project

Used programs and packages.
R: 4.3.0
ggplot2: 3.4.2
Rlab: 4.0
stringr: 1.5.0
forecast: 8.21.1
patchwork: 1.2.0
reshape2: 1.4.4
cowplot: 1.1.2

The final code is found in three parts, LA_1_Definitions.Rmd, LA_2_Baseline_and_Parameterspace.Rmd, LA_3_Fantastical_Scenario.Rmd.
After running LA_Definitions, the other Scripts should be executable. Due to their structure, we advise to execute the codeblocks sequentially and manually, as using Run-All R may try to run several blocks on different cores, leading to errors due to some blocks relying on each other. Also any computation that took longer than ~3minutes on our machines is marked as such, and does not have to be executed.
