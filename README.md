# funx

## Funx

* index( Iterable, predicate expression ) variables: it, x, i
* find( Iterable, predicate expression ) variables: it, x
* exists( Iterable, predicate expression ) variables: it, x
* count( Iterable, predicate expression ) variables: it, x
* each( Iterable, expression ) variables: it, x, i
* sum( Iterable, expression, initial sum ) variables: it, x, i
* reduce( Iterable, expression ) variables: it, x, i, acc
* select( Iterable, predicate expression, initial accumulator ) variables: it, x, i
* apply( Iterable, expression ) variables: it, x, i
* applyselect( Iterable, expression ) variables: it, x, i
* reversed( Array ) 
* sorted( Array, comparsion expression ) variables: it, x, y

## Funx inplace

* selectI( Array, predicate expression ) variables: it, x, i
* applyI( Array, expression ) variables: it, x, i
* applyselectI( Array, expression, predicate expression ) variables: it, x, i
* reversedI( Array )
* sortedI( Array, comparsion expression ) variables: it, x, y

## MapFunx

* each( Map, expression ) variables: it, x, k, i 
* sum( Map, expression, initial sum ) variables: it, x, k, i
* reduce( Map, expression ) variables: it, x, k, acc, i
* select( Map, predicate expression, initial accumulator ) variables: it, x, k, i
* apply( Map, expression ) variables: it, x, k, i
* applyselect( Map, expression ) variables: it, x, k, i

## Funx inplace

* selectI( Map, predicate expression ) variables: it, x, k, i 
* applyI( Map, expression ) variables: it, x, k, i
* applyselectI( Map, expression, predicate expression ) variables: it, x, k, i
