# fPhaseNow

## Contact
Peter Horney, Markus Möller, markus.moeller@julius-kuehn.de

## Principle approach
The SQL statement aims at the derivation of current phase-specific pheneological events of Winter Wheat. A phenological event emerges when a phase-specific temperature sum is reached. Phase-specific temperature sums result the from the analysis of long-term phenological observations, which are related to daily temperature sums between 1993 und the last year before today (see  function [fTemperatureSum](https://github.com/EMRAgit/fTemperatureSum)) substructed by a base temperature of 5.5°C and weighted daily daylenths.

## Parameter
* sysdate - current date
* tmit - daily temperature
* klt = 202 - crop type ID of Winter Wheat
* tsum_pphase  - phenological phases and corresponding medians of long-term temperature sums 
