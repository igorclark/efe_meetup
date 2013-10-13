-module(powers).
-export([raise/2]).

-spec raise(number(), number()) -> number().
raise(_X, 0) -> 1;
raise(X, N) when N < 0 -> 1.0 / raise(X, -N);
raise(X, N) when N > 0 -> raise(X, N, 1).

-spec raise(number(), number(), number()) -> number().
raise(_X, 0, Acc) -> Acc;
raise(X, N, Acc) -> raise(X, N-1, X*Acc).
