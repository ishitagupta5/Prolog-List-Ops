% this is prolog homework 8


% use a helper function and backtracking
% This predicate uses findall on the helper to gather all of the sets
set(List,ListOfSets) :-
    remove_dups(List, Unique),
    % We gather every permutation of every subset via set_helper + permutation
    findall(OnePermutation,
            (
              set_helper(Unique, [], Subset),
              permutation(Subset, OnePermutation)
            ),
            ListOfSets).

% I have two of these...
set_helper([], Acc, Acc).
set_helper([H|T], Acc, Sub) :-
    % Either skip H
    set_helper(T, Acc, Sub);
    % Or include H
    append(Acc, [H], Acc2),
    set_helper(T, Acc2, Sub).

% may not use built-in sum list predicate
% This is just a stub...
% You might want a base case before one like this...
sum([], 0).
sum([Head|Tail], Sum) :-
    sum(Tail, Partial),
    Sum is Partial + Head.


% Again...just a stub.
% Same comment as above...
reverse([], []).
reverse([Head|Tail], Rev) :-
    reverse(Tail, RevTail),
    append(RevTail, [Head], Rev).

% Stub for palindrome
palindrome(String, Palindrome) :-
    reverse_string(String, Rev),
    strings_equal(String, Rev, Equal),
    ( Equal = true ->
      Palindrome = true
    ; Palindrome = false
    ).

% These are the "extra" predicates I wrote to make palindrome pretty trival
% to implement
% I mention this one in the write up
% Not required...but really useful for palindrome
reverse_string(String, Rev) :-
    string_chars(String, Chars),
    reverse(Chars, ReversedChars),
    string_chars(Rev, ReversedChars).

% helper to see if two strings are equal
% I don't think Prolog has a built-in operator for strings
strings_equal(String1, String2, Equal) :-
    string_length(String1, L1),
    string_length(String2, L2),
    ( L1 =\= L2 ->
      Equal = false
    ;
      string_chars(String1, C1),
      string_chars(String2, C2),
      check_letters(C1, C2, Equal)
    ).

% This is used from the strings equal after strings equal has determined that
% the strings are the same length
% This one is recursive and so needs a base case...
check_letters([], [], true).
check_letters([C1|Rest1], [C2|Rest2], E) :-
    ( C1 == C2 ->
      check_letters(Rest1, Rest2, E)
    ;
      E = false
    ).

remove_dups([], []).
remove_dups([H|T], R) :-
    member(H, T),
    !,
    remove_dups(T, R).
remove_dups([H|T], [H|R]) :-
    remove_dups(T, R).
