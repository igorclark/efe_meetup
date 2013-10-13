%% @author Igor Clark <email@address.com>
%% @doc geometry module implementing function from exercise 2-1 of Etudes for Erlang
%% @reference <a href="http://chimera.labs.oreilly.com/books/1234000000726/ch02.html">Etudes for Erlang chapter 2</a>
-module(geom).
-export([area/2]).

%% @doc Calculates the area of a rectangles using supplied Length and Width arguments.
%% Returns the area as an number.
-spec area(number(), number()) -> number().
area(Length, Width) ->
	Length * Width.
