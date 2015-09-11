package ;

import haxe.macro.Expr;

class MapFunx {
	
	macro public static function each<K,X>( it: ExprOf<Map<K,X>>, f: Expr ) return macro {
		var it = $it;
		var i = 0;
		for ( k in it.keys() ) {
			var x = it[k];
			$f;
			i += 1;
		}
	}

	macro public static function select<K,X>( it: ExprOf<Map<K,X>>, p: ExprOf<X> ) return macro {
		var it = $it;
		var out = new Map();
		var i = 0;
		var j = 0;
		for ( k in it.keys() ) {
			var x = it[k];
			if ( $p ) out[k] = x; else j += 1;
			i += 1;
		}
		out;		
	}

	macro public static function reduce<K,X>( it: ExprOf<Map<K,X>>, f: ExprOf<X>, init: ExprOf<X> ) return macro {
		var it = $it;
		var acc = $init;
		var i = 0;	
		for (k in it.keys()) {
			var x = it[k];
			acc = $f;
			i += 1;
		}
		acc;	
	}

	macro public static function apply<K,X>( it: ExprOf<Map<K,X>>, f: ExprOf<X> ) return macro {
		var it = $it;
		var out = new Map();
		var i = 0;
		for ( k in it.keys() ) {
			var x = it[k];
			out[k] = $f;
			i += 1;
		}
		out;		
	}

	macro public static function applyselect<K,X>( it: ExprOf<Map<K,X>>, f: ExprOf<X>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var out = new Map();
		var i = 0;
		var j = 0;
		for ( k in it.keys() ) {
			var x = it[k];
			x = $f;
			if ( $p ) out[k] = x; else j += 1;
			i += 1;
		}
		out;		
	}
	
	macro public static function applyI<K,X>( it: ExprOf<Map<K,X>>, f: ExprOf<X> ) return macro {
		var it = $it;
		var out = it;
		var i = 0;
		for ( k in out.keys() ) {
			var x = out[k];
			out[k] = $f;
			i += 1;
		}
		out;
	}

	macro public static function selectI<K,X>( it: ExprOf<Map<K,X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var out = it;
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
	
	macro public static function applyselectI<K,X>( it: ExprOf<Map<K,X>>, f: ExprOf<X>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var out = it;
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
}

