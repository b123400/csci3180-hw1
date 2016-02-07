      program helloworld
      implicit none

C variables
      INTEGER count
      INTEGER i, j, k

      INTEGER x1, y1, x2, y2
      character table(23, 79)
C program start
      write ( *, '(a)' ) '  Hello, world!'

      open(UNIT=10, ERR=20, FILE='input.txt', STATUS='OLD')
      read(10, 11) count
 11   FORMAT(I2)
      write (*, 11) count

      read(10, 12) x1, y1
 12   FORMAT(I2, 2X, I2)
      write (*, 11) x1
      write (*, 12) y1

c initial table cells
      GOTO 100
 199  k = 0

c print table cells
      GOTO 200
 299  k = 0
      close(10)

      stop
 20   write (*, '(a)') 'Failed open'
      stop
c 21   write

c initial table cells
 100  i = 1
      j = 1
 101  IF (j .GT. 23) GOTO 159
      table(j, i) = '*'
      i = i + 1
      IF (i .GT. 79) GOTO 102
      GOTO 103
 102  j = j + 1
      i = 1
 103  GOTO 101
c draw x axis
 159  i = 1
 160  IF (i .GT. 79) GOTO 162
      table(1, i) = '-'
      i = i + 1
      GOTO 160
c draw y axis
 162  i = 1
 163  IF (i .GT. 23) GOTO 164
      table(i, 1) = '|'
      i = i + 1
      GOTO 163
 164  table(1,1) = '+'
      GOTO 199

c print out the table
 200  i = 1
      j = 23
 201  IF (j .EQ. 0) GOTO 299
      IF (i .LT. 79) WRITE (*, '(a$)') table(j, i)
      IF (i .EQ. 79) WRITE (*, '(a)') table(j, i)
      i = i + 1
      IF (i .GT. 79) GOTO 202
      GOTO 203
 202  i = 1
      j = j - 1
 203  GOTO 201

      stop
      end