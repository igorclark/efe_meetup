-module(powers).
-export([raise/2, nth_root/2]).

-spec raise(number(), number()) -> number().
raise(_X, 0) -> 1;
raise(X, N) when N < 0 -> 1.0 / raise(X, -N);
raise(X, N) when N > 0 -> raise(X, N, 1).

raise(_X, 0, Acc) -> Acc;
raise(X, N, Acc) -> raise(X, N-1, X*Acc).

-spec nth_root(number(), number()) -> number().
nth_root(X, N) -> nth_root(X, N, X / 2.0).

-spec nth_root(number(), number(), number()) -> number().
nth_root(X, N, A) ->
	F = raise(A, N) - X,
	Fprime = N * raise(A, N-1),
	Next = A - F / Fprime,
	Change = abs(Next - A),
	io:format("Current guess is ~.15f~n", [Next]),
	if
		Change < 1.0E-8 -> Next;
		true -> nth_root(X, N, Next)
	end.
