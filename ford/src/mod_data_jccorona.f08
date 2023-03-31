module mod_data_jccorona
  use mod_global_variables, only: dp
  implicit none

  public

  integer, parameter :: n_jccorona = 45
  !> log10 temperature values from Colgan et al. (2008)
  real(dp), protected :: logT_jccorona(n_jccorona)
  !> log10 luminosity values from Colgan et al. (2008)
  real(dp), protected :: logL_jccorona(n_jccorona)


  data logT_jccorona / &
    4.00000_dp, 4.14230_dp, 4.21995_dp, 4.29761_dp, 4.37528_dp, 4.45294_dp, &
    4.53061_dp, 4.60827_dp, 4.68593_dp, 4.76359_dp, 4.79705_dp, 4.83049_dp, &
    4.86394_dp, 4.89739_dp, 4.93084_dp, 4.96428_dp, 4.99773_dp, 5.03117_dp, &
    5.06461_dp, 5.17574_dp, 5.28684_dp, 5.39796_dp, 5.50907_dp, 5.62018_dp, &
    5.73129_dp, 5.84240_dp, 5.95351_dp, 6.06461_dp, 6.17574_dp, 6.28684_dp, &
    6.39796_dp, 6.50907_dp, 6.62018_dp, 6.73129_dp, 6.84240_dp, 6.95351_dp, &
    7.06461_dp, 7.17574_dp, 7.28684_dp, 7.39796_dp, 7.50907_dp, 7.62018_dp, &
    7.73129_dp, 7.84240_dp, 7.95351_dp &
  /
  data logL_jccorona / &
   -200.18883, -100.78630, -30.60384, -22.68481, -21.76445, -21.67936, -21.54218, &
    -21.37958,  -21.25172, -21.17584, -21.15783, -21.14491, -21.13527, -21.12837, &
    -21.12485,  -21.12439, -21.12642, -21.12802, -21.12548, -21.08965, -21.08812, &
    -21.19542,  -21.34582, -21.34839, -21.31701, -21.29072, -21.28900, -21.34104, &
    -21.43122,  -21.62448, -21.86694, -22.02897, -22.08051, -22.06057, -22.01973, &
    -22.00000,  -22.05161, -22.22175, -22.41452, -22.52581, -22.56914, -22.57486, &
    -22.56151, -22.53969, -22.51490  &
  /

end module mod_data_jccorona