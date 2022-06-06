ord(A1,A2,A3,A4,B1,B2,B3,B4) :- perm(B1,B2,B3,B4), 
    							srtd(A1,A2,A3,A4).

permList(A1,A2,A3,A4,B1,B2,B3,B4) :- perm(A1,A2,A3,B1),
    perm(A1,A2,A3,B2),perm(A1,A2,A3,B3),perm(A1,A2,A3,B4),
    perm(A1,A2,B1,B2),perm(A1,A2,B1,B3),perm(A1,A2,B1,B4),
    perm(A1,A2,B2,B3),perm(A1,A2,B2,B4),perm(A1,A2,B3,B4),
    perm(A1,B1,B2,B3),perm(A1,B1,B2,B4),perm(A1,B1,B3,B4),
    perm(A1,B2,B3,B4),perm(A2,A3,A4,B1),perm(A2,A3,A4,B2),
    perm(A2,A3,A4,B3),perm(A2,A3,A4,B4),perm(A2,A3,B1,B2),
    perm(A2,A3,B1,B3),perm(A2,A3,B1,B4),
    perm(A2,A3,B2,B3),perm(A2,A3,B2,B4),perm(A2,A3,B3,B4),
    perm(A2,B1,B2,B3),perm(A2,B1,B2,B4),perm(A2,B1,B3,B4),
    perm(A2,B2,B3,B4),perm(A3,A4,B1,B2),perm(A3,A4,B1,B3),
    perm(A3,A4,B1,B4),
    perm(A3,A4,B2,B3),perm(A3,A4,B2,B4),perm(A3,A4,B3,B4),
    perm(A3,B1,B2,B3),perm(A3,B1,B2,B4),perm(A3,B1,B3,B4),
    perm(A3,B2,B3,B4).
    
srtd(A,B,C,D) :- num(A),num(B),num(C),num(D),
    			 m(A,B),m(B,C),m(C,D).

perm(A1,A2,A3,A4) :- d(A1,A2),d(A1,A3),d(A1,A4),
    				 d(A2,A3),d(A2,A4),
    				 d(A3,A4).
    
order([],[]).
order([X],[X]).
order(A,[X, Y|C]) :- select(X, A, B), order(B, [Y|C]), m(X,Y).

m(0,1).
m(0,2).
m(0,3).
m(0,4).
m(0,5).
m(1,2).
m(1,3).
m(1,4).
m(1,5).
m(2,3).
m(2,4).
m(2,5).
m(3,4).
m(3,5).
m(4,5).

d(0,1).
d(0,2).
d(0,3).
d(0,4).
d(0,5).
d(1,2).
d(1,3).
d(1,4).
d(1,5).
d(2,3).
d(2,4).
d(2,5).
d(3,4).
d(3,5).
d(4,5).

d(1,0).
d(2,0).
d(3,0).
d(4,0).
d(5,0).
d(2,1).
d(3,1).
d(4,1).
d(5,1).
d(3,2).
d(4,2).
d(5,2).
d(4,3).
d(5,3).
d(5,4).

num(0).
num(1).
num(2).
num(3).
num(4).
num(5).