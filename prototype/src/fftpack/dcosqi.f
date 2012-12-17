      SUBROUTINE DCOSQI (N,WSAVE)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION       WSAVE(*)
      DATA PIH /1.57079632679489661923D0/
      DT = PIH/FLOAT(N)
      FK = 0.0D0
      DO 101 K=1,N
         FK = FK+1.0D0
         WSAVE(K) = COS(FK*DT)
  101 CONTINUE
      CALL DFFTI (N,WSAVE(N+1))
      RETURN
      END
