package ;

import haxe.macro.Expr;

class Funx {
	macro public static function xlice<X>( it: ExprOf<Array<X>>, i_: Int, ?n_: Int, ?step_: Int ) {
		if ( n_ == null && ( step_ == null || step <= 1 ) ) { 
			return macro {
				var out = new Array();
				for ( j in $i_...$it.length ) out[j-$i_] = $it[j];
				out;
			}	
		} else if ( step_ == null || step_ <= 1 ) { 
			return macro {
				var out = new Array();
				for ( j in $i_...$it.length ) out[j-$i_] = $it[j];
				out;
			}	
		} else {
			return macro {
				var out = new Array();
				for ( j in $i_...Std.int($it.length / $step_)) out[j-$i_] = $it[j];
				out;
			}
		}
	}

	macro public static function xount<X>( it: ExprOf<Iterable<X>>, f: Expr ) return macro {
		var count = 0;
		for ( x in $it ) {
			if ( x == $f ) {
				count += 1;
			}
		}
		count;
	}

	macro public static function xach<X>( it: ExprOf<Iterable<X>>, f: Expr ) return macro {
		var i = 0;
		for ( x in $it ) {
			$f;
			i += 1;
		}
	}

	macro public static function kxach<K,X>( it: ExprOf<Map<K,X>>, f: Expr ) return macro {
		var i = 0;
		for ( k in $it.keys() ) {
			var x = $it[k];
			$f;
			i += 1;
		}
	}
	
	macro public static function xum<X>( it: ExprOf<Iterable<X>>, ?init: ExprOf<X> ) return macro {
		var acc = $init;
		var iter = $it.iterator();
		if ( acc == null ) acc = iter.next();
		for (x in iter) acc = acc + x;
		acc;
	}

	macro public static function xilter<X>( it: ExprOf<Iterable<X>>, p: Expr ) return macro {
		var out = new Array();
		var i = 0;
		var j = 0;
		for (x in $it) {
			if ( $p ) out.push( x ); else j += 1;
			i += 1;
		}
		out;
	}

	macro public static function kxilter<K,X>( it: ExprOf<Map<K,X>>, p: Expr ) return macro {
		var out = new Map();
		var i = 0;
		var j = 0;
		for ( k in $it.keys() ) {
			var x = $it[k];
			if ( $p ) out[k] = x; else j += 1;
			i += 1;
		}
		out;		
	}
	
	macro public static function kxold<K,X>( it: ExprOf<Map<K,X>>, f: Expr, init: ExprOf<X> ) return macro {
		var acc = $init;
		var i = 0;	
		for (x in $it.keys()) {
			var x = $it[k];
			acc = $f;
			i += 1;
		}
		acc;	
	}

	macro public static function xold<X>( it: ExprOf<Iterable<X>>, f: Expr, init: ExprOf<X> ) return macro {
		var acc = $init;
		var i = 0;	
		for (x in $it) {
			acc = $f;
			i += 1;
		}
		acc;	
	}

	macro public static function xap<X>( it: ExprOf<Iterable<X>>, f: Expr ) return macro {
		var out = new Array();
		var i = 0;
		for (x in $it) {
			out.push( $f );
			i += 1;
		}
		out;
	}

	macro public static function kxap<K,X>( it: ExprOf<Map<K,X>>, f: Expr ) return macro {
		var out = new Map();
		var i = 0;
		for ( k in $it.keys() ) {
			var x = $it[k];
			out[k] = $f;
			i += 1;
		}
		out;		
	}

	macro public static function xapfilter<X>( it: ExprOf<Iterable<X>>, f: Expr, p: Expr ) return macro {
		var out = new Array();
		var i = 0;
		var j = 0;
		for (x in $it) {
			x = $f;
			if ( $p ) out.push( x ); else j += 1;
			i += 1;
		}
		out;
	}

	macro public static function kxapfilter<K,X>( it: ExprOf<Map<K,X>>, f: Expr, p: Expr ) return macro {
		var out = new Map();
		var i = 0;
		var j = 0;
		for ( k in $it.keys() ) {
			var x = $it[k];
			x = $f;
			if ( $p ) out[k] = x; else j += 1;
			i += 1;
		}
		out;		
	}

	macro public static function xeverse<X>( it: ExprOf<Array<X>> ) return macro {
		var out = $it.copy();
		out.reverse();
		out;
	}
	
	// Inplace ultra-dirt macros
	macro public static function xapI<X>( it: ExprOf<Array<X>>, f: Expr ) return macro {
		for (i in 0...$it.length) {
			var x = $it[i];
			$it[i] = $f;
		}
		$it;
	}

	macro public static function kxapI<K,X>( it: ExprOf<Map<K,X>>, f: Expr ) return macro {
		var out = $it;
		var i = 0;
		for ( k in out.keys() ) {
			var x = out[k];
			out[k] = $f;
			i += 1;
		}
		out;
	}

	macro public static function xilterI<X>( it: ExprOf<Array<X>>, p: Expr ) return macro {
		var out = $it;
		var i = 0;
		var j = 0;
		for ( i in 0...out.length ) {
			var x = out[i];
			if ( !($p) ) {
				j += 1;
			}	else {
				out[i-j] = out[j];
			}
		}
		for ( i in 0...j ) out.pop();
		out;
	}

	macro public static function kxilterI<K,X>( it: ExprOf<Map<K,X>>, p: Expr ) return macro {
		var out = $it;
		var i = 0;
		var j = 0;
		for ( k in out.keys() ) {
			var x = out[k];
			if ( !($p) ) {
				j += 1;
				out.remove( k );
			}
			i += 1;
		}
		out;
	}
	
	macro public static function xapfilterI<X>( it: ExprOf<Array<X>>, f: Expr, p: Expr ) return macro {
		var out = $it;
		var i = 0;
		var j = 0;
		for ( i in 0...out.length ) {
			var x = out[i];
		 	x = $f;
			if ( !($p) ) {
				j += 1;
			}	else {
				out[i-j] = x;
			}
		}
		for ( i in 0...j ) out.pop();
		out;
	}

	macro public static function kxapfilterI<K,X>( it: ExprOf<Map<K,X>>, f: Expr, p: Expr ) return macro {
		var out = $it;
		var i = 0;
		var j = 0;
		for ( k in out.keys() ) {
			var x = out[k];
			x = $f;
			if ( !($p) ) {
				j += 1;
				out.remove( k );
			} else {
				out[k] = x;
			}
			i += 1;
		}
		out;
	}
	
	macro public static function xeverseI<X>( it: ExprOf<Array<X>> ) return macro {
		var out = $it;
		out.reverse();
		out;
	}
}
