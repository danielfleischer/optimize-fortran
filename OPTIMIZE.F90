PROGRAM OPTIMIZE

  IMPLICIT NONE

  INTEGER, PARAMETER :: dp = KIND(1.0d0)

  REAL(dp) :: a,b,phi,tol
  REAL(dp) :: x,y
  CHARACTER(100) :: str

  phi = (1.0 + SQRT(5.0)) / 2.0
  tol = 1e-6

  CALL getarg(1,str)
  READ (str,'(F10.10)') a
  
  CALL getarg(2,str)
  READ (str,'(F10.10)') b

  x = solve(a,b,tol)
  y = my_function(x)
  WRITE(*,*) "Minimum at ", x, " value is ",y

CONTAINS

  FUNCTION my_function(x) RESULT(y)
    IMPLICIT NONE
    REAL(dp) :: x,y

    y = x**2 + SIN(x)/x - x

  END FUNCTION my_function

  FUNCTION solve(a,b,tol0) RESULT(ans)
    IMPLICIT NONE
    REAL(dp),INTENT(inout) :: a,b
    REAL(dp) , INTENT(in) :: tol0
    REAL(dp) :: c,d,ans

    c = b - (b - a) / phi
    d = a + (b - a) / phi

    DO WHILE (ABS(c - d) > tol0)
       IF (my_function(c) < my_function(d)) THEN
          b = d
       ELSE
          a = c
       END IF

       c = b - (b - a) / phi
       d = a + (b - a) / phi

    END DO

    ans = (a + b) / 2.0

  END FUNCTION solve

END PROGRAM OPTIMIZE
