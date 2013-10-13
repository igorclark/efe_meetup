-module(powers).
-export([raise/2]).

-spec raise(number(), number()) -> number().
raise(_X, N) when N =:= 0 -> 1;	% raise(_X, 0) -> 1;
raise(X, N) when N =:= 1 -> X; % raise(X, 1) -> X;
raise(X, N) when N >= 0 -> X * raise(X, N-1); % when N > 0
raise(X, N) when N < 0 -> 1.0 / raise(X, 0-N). % ... raise(X, -N).

