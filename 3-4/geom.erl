%% @author Igor Clark <email@address.com>
%% @doc geometry module implementing function from exercise 2-1 of Etudes for Erlang
%% @reference <a href="http://chimera.labs.oreilly.com/books/1234000000726/ch02.html">Etudes for Erlang chapter 2</a>
-module(geom).
-export([area/1]).

%% @doc Takes a tuple with type and 2 arguments and calls the appropriate internal function.
%% Returns the result as a number.
-spec area({atom, number(), number()}) -> number().
area({Type, A, B}) ->
	area(Type, A, B).

%% @doc Calculates the area of a rectangles using supplied Length and Width arguments.
%% Guards ensure no negative numbers.
%% Returns the area as a number.
-spec area(rectangle, number(), number()) -> number().
area(rectangle, Length, Width) when Length >= 0, Width >=0 ->
	Length * Width;

%% @doc Calculates the area of a triangle using supplied Base and Height arguments.
%% Guards ensure no negative numbers.
%% Returns the area as a number.
area(triangle, Base, Height) when Base >= 0, Height >=0 ->
	Base * Height / 2.0;

%% @doc Calculates the area of an ellipse using supplied Major and Minor
%% Guards ensure no negative numbers.
%% Returns the area as a number.
area(ellipse, Major, Minor) when Major >= 0, Minor >=0 ->
	math:pi() * Major * Minor;

%% @doc Catch-all demonstrates use of underscore variable.
%% Returns zero to show this is bad.
area(_, _, _) ->
	0.
