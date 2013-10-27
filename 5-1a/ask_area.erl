%% changed out the area() function after looking at http://chimera.labs.oreilly.com/books/1234000000726/apa.html#_literal_ask_area_erl_literal
%% i think i was trying to be smart and reduce complexity but
%% overall it was increasing complexity and readability and
%% i don't think it was very erlangy at all
-module(ask_area).
-export([area/0]).

area() ->
	Prompt = "R)ectangle, T)riangle, or E)llipse > ",
	Choice = hd(string:to_lower(io:get_line(Prompt))),
	Shape = char_to_shape(Choice),
	{N1, N2} = case Shape of
		unknown -> {error, "Unknown shape " ++ [Choice]};
		rectangle -> get_dimensions("width", "height");
		triangle -> get_dimensions("base", "height");
		ellipse -> get_dimensions("major axis", "minor axis")
	end,
	calculate(Shape, N1, N2).

char_to_shape($r) -> rectangle;
char_to_shape($t) -> triangle;
char_to_shape($e) -> ellipse;
char_to_shape(_) -> unknown.

get_dimensions(A, B) ->
	{get_number(A), get_number(B)}.

get_number(Type) ->
	Input = io:get_line("Enter " ++ Type ++ " > "),
	case string:to_float(Input) of
		{error, _Reason} ->
			case string:to_integer(Input) of
				{error, _Reason} -> error;
				{Int, _Rest} -> Int
			end;
		{Float, _Rest} -> Float
	end.

calculate(unknown, error, Reason) -> io:format("~s~n", [Reason]);
calculate(_, error, _) -> io:format("Error in first number.~n");
calculate(_, _, error) -> io:format("Error in second number.~n");
calculate(_, A, B) when A < 0 ; B < 0 ->
	io:format("Both numbers must be greater than or equal to zero.");
calculate(Shape, A, B) -> geom:area(Shape, A, B).
