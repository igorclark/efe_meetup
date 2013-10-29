-module(stats).
-export([
	minimum/1,
	maximum/1,
	range/1
]).

-spec minimum(list()) -> number().
minimum([]) -> {error, empty_list};
minimum([H|T]) -> minimum(T, H).

-spec minimum(list(), number()) -> number().
minimum([], Candidate) -> Candidate;
minimum([H|T], Candidate) when H < Candidate -> minimum(T, H);
minimum([_H|T], Candidate) -> minimum(T, Candidate).

-spec maximum(list()) -> number().
maximum([]) -> {error, empty_list};
maximum([H|T]) -> maximum(T, H).

-spec maximum(list(), number()) -> number().
maximum([], Candidate) -> Candidate;
maximum([H|T], Candidate) when H > Candidate -> maximum(T, H);
maximum([_H|T], Candidate) -> maximum(T, Candidate).

-spec range(list()) -> list().
range([]) -> [];
range(List) when is_list(List) -> [minimum(List), maximum(List)].

