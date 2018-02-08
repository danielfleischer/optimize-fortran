F90=gfortran

OPT = -Wall -Wextra -Wimplicit-interface -fPIC  -O3 -march=native -ffast-math -funroll-loops

BFGS: OPTIMIZE.o
	$(F90) $(OPT) -o OPTIMIZE OPTIMIZE.o

OPTIMIZE.o: OPTIMIZE.F90 
	 $(F90) $(OPT) -c OPTIMIZE.F90

clean:
	rm -f *.o OPTIMIZE
