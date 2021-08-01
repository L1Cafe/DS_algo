% modulus base case
gcd_mod(A,B,Result) :-
    Remainder is A - B,
    B > Remainder,
    !,
    Result is Remainder.

% modulus recursive case
gcd_mod(A,B,Result) :-
    Remainder is A - B,
    Remainder >= B,
    gcd_mod(Remainder,B,Result).
    
% GCD base case
gcd_final(A,B,GCD) :-
    gcd_mod(A,B,R),
    R is 0,
    !,
    GCD is B.

% GCD recursive case
gcd_final(A,B,GCD) :-
    gcd_mod(A,B,R),
    gcd_final(B,R,GCD).

% If A and B are supplied in order, continue
gcd_aux(A,B,GCD) :-
    A > B,
    !,
    gcd_final(A,B,GCD).

% If A and B are not in the correct order, swap them and continue
gcd_aux(A,B,GCD) :-
    B > A,
    !,
    gcd_final(B,A,GCD).

% "main" function
gcd(A,B,GCD) :-
    gcd_aux(A,B,GCD).
