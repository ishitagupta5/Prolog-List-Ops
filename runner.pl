#!/usr/bin/env swipl

:- initialization(main, main).

main(Argv) :-
    make_go_now(Argv).

% prolog file for running homework 8
% make sure your file matches the name in the consult below
make_go_now(Argv) :- length(Argv,L), 
  (L == 2
   -> consult(homework8),  go(Argv)
   ; writeln("Usage: ./runner.pl input.txt output.txt")
   ).

go([In,Output]) :- read_file_to_string(In, Words, [] ),
	split_string(Words, " \n", "\n", WordsAgain),
	convert_strings_to_terms(WordsAgain, [], FinalWords ),
	open(Output,write,Out),
	really_go_now(FinalWords,Out).

convert_strings_to_atoms([],Sentence,Sentence).
convert_strings_to_atoms([Head|Tail],Builder,Sentence) :- 
	string_to_atom(Head,Atom), 
	append(Builder,[Atom],New_Builder),
	convert_strings_to_atoms(Tail,New_Builder,Sentence).

convert_strings_to_terms([],Sentence,Sentence).
convert_strings_to_terms([Head|Tail],Builder,Sentence) :- 
	term_string(Term,Head), 
	append(Builder,[Term],New_Builder),
	convert_strings_to_terms(Tail,New_Builder,Sentence).

print_list([]).
print_list([Head|Tail]) :- write(" "),write(Head), write(" "), print_list(Tail).

print_list([],Stream):- nl(Stream).
print_list([Head|Tail],Stream) :- write(Stream," "),write(Stream,Head), 
write(Stream," "), print_list(Tail,Stream).

really_go_now([Head,List|Tail],Out) :-
	Head == set,
	write(Out,Head),
	write(Out, " "),write(Out, List),
	set(List,Set),
	sort(Set, Sorted),
	write(Out, " "),write(Out,Sorted),
	writeln(Out,""),
	really_go_now(Tail,Out).

really_go_now([Head,List|Tail],Out) :-
	Head == sum,
	write(Out, Head),
	write(Out, " "), write(Out, List),
	sum(List,Number),
	write(Out, " "),writeln(Out, Number),
	really_go_now(Tail,Out).

really_go_now([Head, List|Tail],Out) :-
	Head == reverse,
	write(Out, Head),
	write(Out, " "),write(Out, List),
	reverse(List,ReversedList),
	write(Out, " "),writeln(Out, ReversedList),
	really_go_now(Tail,Out).
	
really_go_now([Head, Word|Tail],Out) :-
	Head == palindrome,
	write(Out, Head),
	write(Out, " "),write(Out, Word),
	palindrome(Word,IsPalindrome),
	write(Out, " "),writeln(Out, IsPalindrome),
	really_go_now(Tail,Out).

really_go_now([],_).	

