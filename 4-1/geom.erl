%% @author Igor Clark <email@address.com>
%% @doc geometry module implementing function from exercise 2-1 of Etudes for Erlang
%% @reference <a href="http://chimera.labs.oreilly.com/books/1234000000726/ch02.html">Etudes for Erlang chapter 2</a>
-module(geom).
-export([area/3]).

%% @doc Calculates the area of various shapes using supplied A and B arguments.
%% Applies appropriate calculation according to supplied shape type.
%% Guards ensure no negative numbers.
%% Returns the area as a number.
-spec area(atom, number(), number()) -> number().
area(Type, A, B) when A >=0, B >= 0 ->
	case Type of
		rectangle -> A * B;
		triangle -> A * B / 2.0;
		ellipse -> math:pi() * A * B
	end.
