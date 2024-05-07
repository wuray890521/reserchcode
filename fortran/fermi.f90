PROGRAM fermi
    implicit none
    INTEGER :: i
    REAL(kind=8) :: t, mu, ef, f
    INTEGER :: iounit
    ! Boltzmann constant by wiki in eV/K
    REAL, parameter :: kb = 8.617343E-5 
    PRINT *, 'Input temp.:'
    READ (*,*) t
    PRINT *, 'Input chemical potential:'    
    READ (*,*) mu
    PRINT *, 'Input fermi_energy:'
    READ (*,*) ef
    ! Open the file for writing
    OPEN(UNIT=iounit, FILE='fermi_output.dat', STATUS='REPLACE', ACTION='WRITE')
    IF (t < 10) THEN
        t = 10
    ELSE 
        t = t
    END IF
    ! Loop to calculate and write the values of f to the file
    do i = 1, 1000
        f = 1/(EXP(((DBLE(i)/100)-ef-mu)/(kb*t)) + 1)
        WRITE (iounit,*) DBLE(i)/10000, f
    end do
    ! Close the file
    CLOSE(iounit)
END PROGRAM fermi