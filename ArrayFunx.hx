package ;

import haxe.macro.Expr;

class ArrayFunx {
	
	macro public static function index<X>( it: ExprOf<Array<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var index = -1;
		for ( i in 0...it.length ) {
			var x = x[i];
			if ( $p ) {
				index = i;
				break;
			}
		}
		index;
	}

	macro public static function find<X>( it: ExprOf<Array<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var item = null;
		for ( i in 0...it.length ) {
			var x = it[i];
			if ( $p ) {
				item = x;
				break;
			}
		}
		item;
	}
	
	macro public static function empty<X>( it: ExprOf<Array<X>> ) return macro {
		x.length == 0;
	}

	macro public static function exists<X>( it: ExprOf<Array<X>>, y: ExprOf<X> ) return macro {
		var it = $it;
		var exists = false;
		for ( i in 0...it.length ) {
			var x = it[i];
			if ( x == $y ) {
				exists = true;
				break;
			}
		}
		exists;
	}

	macro public static function any<X>( it: ExprOf<Array<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var result = false;
		for ( i in 0...it.length ) {
			var x = it[i];
			if ( $p ) {
				result = true;
				break;
			}
		}
		result;
	}
	
	macro public static function all<X>( it: ExprOf<Array<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var result = true;
		for ( i in 0...it.length ) {
			var x = it[i];
			if ( $p ) {
				result = false;
				break;
			}
		}
		result;
	}
	
	macro public static function count<X>( it: ExprOf<Array<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var count = 0;
		for ( i in 0...it.length ) {
			var x = it[i];
			if ( $p ) {
				count += 1;
			}
		}
		count;
	}

	macro public static function each<X>( it: ExprOf<Array<X>>, f: Expr ) return macro {
		var it = $it;
		for ( i in 0...it.length ) {
			var x = it[i];
			$f;
		}
	}
	
	macro public static function sum<X>( it: ExprOf<Array<X>>, init: ExprOf<X> ) return macro {
		var it = $it;
		var acc = $init;
		for ( i in 0...it.length ) {
			var x = it[i];
			acc += x;
		}
		acc;
	}

	macro public static function select<X>( it: ExprOf<Array<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var out = new Array();
		var j = 0;
		for ( i in 0...it.length ) {
			var x = it[i];
			if ( $p ) out.push( x ); else j += 1;
		}
		out;
	}
	
	macro public static function reduce<X>( it: ExprOf<Array<X>>, f: ExprOf<X>, init: ExprOf<X> ) return macro {
		var it = $it;
		var acc = $init;
		for ( i in 0...it.length ) {
			var x = it[i];
			acc = $f;
		}
		acc;	
	}

	macro public static function apply<X>( it: ExprOf<Array<X>>, f: ExprOf<X> ) return macro {
		var it = $it;
		var out = new Array();
		for ( i in 0...it.length ) {
			var x = it[i];
			out.push( $f );
		}
		out;
	}

	macro public static function applyselect<X>( it: ExprOf<Array<X>>, f: ExprOf<X>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var out = new Array();
		var j = 0;
		for ( i in 0...it.length ) {
			var x = it[i];
			if ( $p ) out.push( x ); else j += 1;
		}
		out;
	}

	macro public static function selectapply<X>( it: ExprOf<Array<X>>, p: ExprOf<Bool>, f: ExprOf<X> ) return macro {
		var it = $it;
		var out = new Array();
		var j = 0;
		for ( i in 0...it.length ) {
			var x = it[i];
			if ( $p ) out.push( $f ); else j += 1;
		}
		out;
	}

	macro public static function reversed<X>( it: ExprOf<Array<X>> ) return macro {
		var out = $it.copy();
		out.reverse();
		out;
	}

	macro public static function sorted<X>( it: ExprOf<Array<X>>, f: ExprOf<Int> ) return macro {
		var it = $it;
		var out = it.copy();
		out.sort( function(x,y) return $f );
		out; 
	}

	// Inplace ultra-dirt macros use with great caution
	macro public static function applyI<X>( it: ExprOf<Array<X>>, f: ExprOf<X> ) return macro {
		var it = $it;
		var out = it;
		for (i in 0...it.length) {
			var x = out[i];
			out[i] = $f;
		}
		out;
	}

	macro public static function selectI<X>( it: ExprOf<Array<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var out = it;
		var j = 0;
		for ( i in 0...out.length ) {
			var x = out[i];
			if ( !($p) ) {
				j += 1;
			}	else {
				out[i-j] = x;
			}
		}
		for ( i in 0...j ) out.pop();
		out;
	}
	
	macro public static function applyselectI<X>( it: ExprOf<Array<X>>, f: ExprOf<X>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var out = it;
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
	
	macro public static function selectapplyI<X>( it: ExprOf<Array<X>>, p: ExprOf<Bool>, f: ExprOf<X> ) return macro {
		var it = $it;
		var out = it;
		var j = 0;
		for ( i in 0...out.length ) {
			var x = out[i];
			if ( !($p) ) {
				j += 1;
			}	else {
				out[i-j] = $f;
			}
		}
		for ( i in 0...j ) out.pop();
		out;
	}

	macro public static function reversedI<X>( it: ExprOf<Array<X>> ) return macro {
		var out = $it;
		out.reverse();
		out;
	}
	
	macro public static function sortedI<X>( it: ExprOf<Array<X>>, f: ExprOf<Int> ) return macro {
		var it = $it;
		var out = it;
		out.sort( function(x,y) return $f );
		out;
	}
}
