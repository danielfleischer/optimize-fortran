PROGRAM OPTIMIZE

  IMPLICIT NONE

  INTEGER, PARAMETER :: dp = KIND(1.0d0)

  INTEGER :: i
  REAL(dp) :: r


  r = 2.1234000000  

  WRITE (*,*) "Number is = ",r

  WRITE(*,*) "Results = ", my_function(r)

CONTAINS
  
  FUNCTION my_function(x)
    IMPLICIT NONE
    REAL(dp) :: my_function
    REAL(dp) :: x

    my_function = x**2
  END FUNCTION my_function


END PROGRAM OPTIMIZE
