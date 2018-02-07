F90=gfortran

OPT = -Wall -Wextra -Wimplicit-interface -fPIC  -O3 -march=native -ffast-math -funroll-loops

BFGS: BFGS.o
	$(F90) $(OPT) -o BFGS BFGS.o

BFGS.o: BFGS.F90 
	 $(F90) $(OPT) -c BFGS.F90

clean:
	rm -f *.o
