% The main predicate. Solve the puzzle and print the answer.
% The variable Rij stands for the number in row i and column j.
sudoku(R11,R12,R13,R14,R15,R16,R17,R18,R19
       R21,R22,R23,R24,R25,R26,R27,R28,R29
       R31,R32,R33,R34,R35,R36,R37,R38,R39
       R41,R42,R43,R44,R45,R46,R47,R48,R49
       R51,R52,R53,R54,R55,R56,R57,R58,R59
       R61,R62,R63,R64,R65,R66,R67,R68,R69
       R71,R72,R73,R74,R75,R76,R77,R78,R79
       R81,R82,R83,R84,R85,R86,R87,R88,R89
       R91,R92,R93,R94,R95,R96,R97,R98,R99) :-
   solution(R11,R12,R13,R14,R15,R16,R17,R18,R19
      		R21,R22,R23,R24,R25,R26,R27,R28,R29
     	    R31,R32,R33,R34,R35,R36,R37,R38,R39
       		R41,R42,R43,R44,R45,R46,R47,R48,R49
       		R51,R52,R53,R54,R55,R56,R57,R58,R59
       		R61,R62,R63,R64,R65,R66,R67,R68,R69
       		R71,R72,R73,R74,R75,R76,R77,R78,R79
       		R81,R82,R83,R84,R85,R86,R87,R88,R89
       		R91,R92,R93,R94,R95,R96,R97,R98,R99), 
   nl, write('A solution to this puzzle is'), nl, 
   printrow(R11,R12,R13,R14,R15,R16,R17,R18,R19), 
   printrow(R21,R22,R23,R24,R25,R26,R27,R28,R29), 
   printrow(R31,R32,R33,R34,R35,R36,R37,R38,R39),
   printrow(R41,R42,R43,R44,R45,R46,R47,R48,R49),
   printrow(R51,R52,R53,R54,R55,R56,R57,R58,R59),
   printrow(R61,R62,R63,R64,R65,R66,R67,R68,R69),
   printrow(R71,R72,R73,R74,R75,R76,R77,R78,R79),
   printrow(R81,R82,R83,R84,R85,R86,R87,R88,R89),
   printrow(R91,R92,R93,R94,R95,R96,R97,R98,R99).

% Print a row of four numbers with spaces between them. 
printrow(P,Q,R,S,T,U,V,X,Z) :- write('  '), write(P), write(' '), write(Q),
   write(' '), write(R), write(' '), write(S), write(' '), write(T), 
   write(' '), write(U), write(' '), write(V), write(' '), write(X), 
   write(' '), write(Z), nl.

%------------------------------------------------------------------
solution(R11,R12,R13,R14,R15,R16,R17,R18,R19
      	 R21,R22,R23,R24,R25,R26,R27,R28,R29
     	 R31,R32,R33,R34,R35,R36,R37,R38,R39
       	 R41,R42,R43,R44,R45,R46,R47,R48,R49
       	 R51,R52,R53,R54,R55,R56,R57,R58,R59
       	 R61,R62,R63,R64,R65,R66,R67,R68,R69
       	 R71,R72,R73,R74,R75,R76,R77,R78,R79
       	 R81,R82,R83,R84,R85,R86,R87,R88,R89
       	 R91,R92,R93,R94,R95,R96,R97,R98,R99) :-
   uniq(R11,R12,R13,R14,R15,R16,R17,R18,R19), uniq(R21,R22,R23,R24,R25,R26,R27,R28,R29),       % rows 1,2   
   uniq(R31,R32,R33,R34,R35,R36,R37,R38,R39), uniq(R41,R42,R43,R44,R45,R46,R47,R48,R49),       % rows 3,4
   uniq(R51,R52,R53,R54,R55,R56,R57,R58,R59), uniq(R61,R62,R63,R64,R65,R66,R67,R68,R69),       % rows 5,6
   uniq(R71,R72,R73,R74,R75,R76,R77,R78,R79), uniq(R81,R82,R83,R84,R85,R86,R87,R88,R89),       % rows 7,8
   uniq(R91,R92,R93,R94,R95,R96,R97,R98,R99)                                                   % rows 9
    
   uniq(R11,R21,R31,R41,R51,R61,R71,R81,R91), uniq(R12,R22,R32,R42,R52,R62,R72,R82,R92),       % cols 1,2
   uniq(R13,R23,R33,R43,R53,R63,R73,R83,R93), uniq(R14,R24,R34,R44,R54,R64,R74,R84,R94),       % cols 3,4
   uniq(R14,R23,R33,R43,R53,R63,R73,R83,R93), uniq(R14,R24,R34,R44,R54,R64,R74,R84,R94),       % cols 5,6
   uniq(R13,R23,R33,R43,R53,R63,R73,R83,R93), uniq(R14,R24,R34,R44,R54,R64,R74,R84,R94),       % cols 7,8
   uniq(R13,R23,R33,R43,R53,R63,R73,R83,R93), uniq(R14,R24,R34,R44,R54,R64,R74,R84,R94),       % cols 9
   uniq(R11,R12,R21,R22), uniq(R13,R14,R23,R24),       % NW and NE
   uniq(R31,R32,R41,R42), uniq(R33,R34,R43,R44).       % SW and SE

% uniq holds if P,Q,R,S are all distinct nums (from 1 to 4).
uniq(P,Q,R,S) :- num(P),  num(Q),  num(R),  num(S),  
                 \+ P=Q, \+ P=R, \+ P=S, \+ Q=R, \+ Q=S, \+ R=S.

% The four numbers to go into each cell
num(1).  num(2).  num(3).  num(4).