-module(ask_area).
-export([area/0]).

area() ->
	Prompt = "R)ectangle, T)riangle, or E)llipse > ",
	Choice = hd(string:to_lower(io:get_line(Prompt))),
	Shape = char_to_shape(Choice),
	{N1, N2} = case Shape of
		unknown -> {error, "Unknown shape " ++ [Choice]};
		Shape ->
			{DimA, DimB} = char_to_dimension_types(Choice),
			get_dimensions(DimA, DimB)
	end,
	calculate(Shape, N1, N2).

char_to_shape($r) -> rectangle;
char_to_shape($t) -> triangle;
char_to_shape($e) -> ellipse;
char_to_shape(_) -> unknown.

char_to_dimension_types($r) -> {"width", "height"};
char_to_dimension_types($t) -> {"base", "height"};
char_to_dimension_types($e) -> {"major axis", "minor axis"}.

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
