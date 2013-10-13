%% @author Igor Clark <email@address.com>
%% @doc geometry module implementing function from exercise 2-1 of Etudes for Erlang
%% @reference <a href="http://chimera.labs.oreilly.com/books/1234000000726/ch02.html">Etudes for Erlang chapter 2</a>
-module(geom).
-export([area/3]).

%% @doc Calculates the area of a rectangle using supplied Length and Width arguments.
%% Returns the area as a number.
-spec area(rectangle, number(), number()) -> number().
area(rectangle, Length, Width) ->
	Length * Width;

%% @doc Calculates the area of a triangle using supplied Base and Height arguments.
%% Returns the area as a number.
area(triangle, Base, Height) ->
	Base * Height / 2.0;

%% @doc Calculates the area of an ellipse using supplied Major and Minor
%% Returns the area as a number.
area(ellipse, Major, Minor) ->
	math:pi() * Major * Minor.
