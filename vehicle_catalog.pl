% PARTE 1: Catálogo de Vehículos (Hechos)

% Definición: vehicle(Marca, Referencia, Tipo, Precio, Año).

:- dynamic vehicle/5.

% Hechos iniciales (Brand en minúscula, tipos: sedan, suv, pickup, sport)
vehicle(toyota, corolla, sedan, 22000, 2023).
vehicle(toyota, camry, sedan, 28000, 2022).
vehicle(toyota, rav4, suv, 29500, 2023).
vehicle(toyota, hilux, pickup, 35000, 2022).
vehicle(ford, focus, sedan, 21000, 2022).
vehicle(ford, escape, suv, 31000, 2023).
vehicle(ford, f150, pickup, 40000, 2022).
vehicle(ford, mustang, sport, 48000, 2023).
vehicle(bmw, serie3, sedan, 45000, 2023).
vehicle(bmw, x5, suv, 65000, 2022).
vehicle(honda, civic, sedan, 23500, 2023).

add_vehicle(Brand0, Ref, Type0, Price, Year) :-
  % Normalizar cadenas a minúsculas
  downcase_atom(Brand0, Brand),
  downcase_atom(Type0,   Type),
  % Evitar duplicados
  \+ vehicle(Brand, Ref, _, _, _),
  assertz(vehicle(Brand, Ref, Type, Price, Year)).

% PARTE 2: Consultas Básicas y Filtros

meet_budget(Ref, Type, BudgetMax) :-
  vehicle(_, Ref, Type, Price, _),
  Price =< BudgetMax.

% Lista todas las referencias (Ref) de una marca dada

refs_by_brand(Brand, Refs) :-
  bagof(Ref, vehicle(Brand, Ref, _, _, _), Refs).

% Detalles completos de vehículos de una marca
vehicles_by_brand(Brand, List) :-
  findall((Ref, Type, Price, Year),
          vehicle(Brand, Ref, Type, Price, Year),
          List).

% PARTE 3: Generación de Reportes

sum_list([], 0).
sum_list([H|T], Sum) :-
  sum_list(T, Rest),
  Sum is H + Rest.

sum_prices([], 0).
sum_prices([(_,_,_,Price,_)|R], Total) :-
  sum_prices(R, Rest),
  Total is Price + Rest.

generate_report(Brand, Type, Budget, MaxTotal, (Selected, Total)) :-
  setof((P,Ref,Y), (vehicle(Brand,Ref,Type,P,Y), P =< Budget), Sorted),
  select_under_budget(Sorted, MaxTotal, [], SelRev, 0, Total),
  reverse(SelRev, Selected).

select_under_budget([], _, Acc, Acc, Tot, Tot).
select_under_budget([(P,Ref,Y)|Rest], Max, Acc, Sel, Sum0, Sum) :-
  NewSum is Sum0 + P,
  ( NewSum =< Max ->
      select_under_budget(Rest, Max, [(Brand,Ref,Type,P,Y)|Acc], Sel, NewSum, Sum)
  ;  Sel = Acc, Sum = Sum0 ) .


% PARTE 4: Casos de Prueba (Consultas a ejecutar)

calculate_total_value_by_type(Type, Max, Total) :-
  findall(Price, vehicle(_,_,Type,Price,_), List),
  sum_list(List, Sum),
  Sum =< Max,
  Total = Sum.

% Imprime mensaje según cumpla o exceda
check_total_value_by_type(Type, Max) :-
  findall(Price, vehicle(_,_,Type,Price,_), List),
  sum_list(List, Sum),
  ( Sum =< Max ->
      format('Valor total para ~w: $~w (dentro de $~w).~n',[Type,Sum,Max])
    ; format('Valor total para ~w: $~w (EXCEDE $~w)!~n',[Type,Sum,Max]) ).
