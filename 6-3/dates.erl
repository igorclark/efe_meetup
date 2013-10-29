-module(dates).
-export([date_parts/1, julian/1]).

-spec date_parts(string()) -> [integer()].
date_parts(DateString) ->
	ComponentStrings = re:split(DateString, "-", [{return, list}]),
	[get_number(S)||S<-ComponentStrings].

-spec get_number(string()) -> integer().
get_number(String) ->
	{Number, _Rest} = string:to_integer(String),
	Number.

-spec julian(string()) -> integer().
julian(DateString) ->
	[Y, M, D] = date_parts(DateString),
	DaysInFeb = case is_leap_year(Y) of
		true -> 29;
		false -> 28
	end,
	MonthLengths = [31, DaysInFeb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
	julian(Y, M, D, MonthLengths, 0).

-spec julian(integer(), integer(), integer(), list(), integer()) -> integer().
julian(_Y, _M, _D, [], Acc) -> Acc;

% this totally did my head in, i ended up having to look at the solution
% and i still can't see how the description of what the clauses should do
% isn't back to front. it says "you know you're doing the last call when
% the month number is greater than (13 - length(days_per_month_list)).
% surely in fact that's exactly the condition under which you should continue,
% and when that's not sor, you should stop and return the result?
% that's how this works, and it's like the solution, and this gives the right answers.
% grrrrrr. shouldn't have listened, i wasted an hour on this.
julian(Y, M, D, ML = [H|T], Acc) when M > (13 - length(ML)) -> julian(Y, M, D, T, Acc + H);
julian(_Y, _M, D, _ML, Acc) -> Acc + D.

-spec is_leap_year(integer()) -> (true | false).
is_leap_year(Year) ->
	(Year rem 4 == 0 andalso Year rem 100 /= 0)
	orelse (Year rem 400 == 0).
