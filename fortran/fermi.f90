PROGRAM fermi
    implicit none
    INTEGER :: i
    REAL(kind=8) :: t, mu, ef, f
    INTEGER :: iounit
    ! Boltzmann constant by wiki in eV/K
    REAL, parameter :: kb = 8.617343E-5 
    PRINT *, "The value of Boltzmann constant is: ", kb
    PRINT *, 'Input temp.:'
    READ (*,*) t
    PRINT *, 'Input chemical potential:'
    READ (*,*) mu
    PRINT *, 'Input fermi_energy:'
    READ (*,*) ef

    ! Open the file for writing
    OPEN(UNIT=iounit, FILE='fermi_output.txt', STATUS='REPLACE', ACTION='WRITE')

    ! Loop to calculate and write the values of f to the file
    do i = 1, 100000
        f = 1/(EXP(((DBLE(i)/10000)-ef-mu)/(kb*t)) + 1)
        WRITE (iounit,*) DBLE(i)/10000, f
    end do

    ! Close the file
    CLOSE(iounit)
END PROGRAM fermi