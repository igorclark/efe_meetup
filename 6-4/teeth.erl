-module(teeth).
-export([alert/1]).

alert(PocketDepths) when is_list(PocketDepths) ->
	check_pocket_depths(PocketDepths, 0, []).

check_pocket_depths([], _PocketNum, Acc) -> Acc;
check_pocket_depths([[0]|T], PocketNum, Acc) -> check_pocket_depths(T, PocketNum+1, Acc);

check_pocket_depths([H|T], PocketNum, Acc) ->
	NewPocketNum = PocketNum+1,
	PocketAlert = case stats:maximum(H) >= 4 of
		true -> Acc ++ [NewPocketNum];
		false -> Acc
	end,
	check_pocket_depths(T, NewPocketNum, PocketAlert).
	
