-module(stats).
-export([minimum/1]).

-spec minimum(list()) -> number().
minimum([]) -> {error, empty_list};
minimum([H|T]) -> minimum(T, H).

-spec minimum(list(), number()) -> number().
minimum([], Candidate) -> Candidate;
minimum([H|T], Candidate) when H < Candidate -> minimum(T, H);
minimum([_H|T], Candidate) -> minimum(T, Candidate).
