-module(dates).
-export([date_parts/1]).

-spec date_parts(string()) -> [integer()].
date_parts(DateString) ->
	ComponentStrings = re:split(DateString, "-", [{return, list}]),
	[get_number(S)||S<-ComponentStrings].

-spec get_number(string()) -> integer().
get_number(String) ->
	{Number, _Rest} = string:to_integer(String),
	Number.
