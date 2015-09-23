package ;

import haxe.macro.Expr;

class Funx {
	
	macro public static function index<X>( it: ExprOf<Iterable<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var index = -1;
		var i = 0;
		for ( x in it ) {
			if ( $p ) {
				index = i;
				break;
			}
			i += 1;
		}
		index;
	}

	macro public static function find<X>( it: ExprOf<Iterable<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var item = null;
		var i = 0;
		for ( x in it ) {
			if ( $p ) {
				item = x;
				break;
			}
			i += 1;
		}
		item;
	}
	
	macro public static function empty<X>( it: ExprOf<Iterable<X>> ) return macro {
		!x.iterator().hasNext();
	}

	macro public static function exists<X>( it: ExprOf<Iterable<X>>, y: ExprOf<X> ) return macro {
		var it = $it;
		var exists = false;
		var i = 0;
		for ( x in it ) {
			if ( x == $y ) {
				exists = true;
				break;
			}
			i += 1;
		}
		exists;
	}

	macro public static function any<X>( it: ExprOf<Iterable<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var i = 0;
		var result = false;
		for ( x in it ) {
			if ( $p ) {
				result = true;
				break;
			}
			i += 1;
		}
		result;
	}
	
	macro public static function all<X>( it: ExprOf<Iterable<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var i = 0;
		var result = true;
		for ( x in it ) {
			if ( $p ) {
				result = false;
				break;
			}
			i += 1;
		}
		result;
	}
	
	macro public static function count<X>( it: ExprOf<Iterable<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var i = 0;
		var count = 0;
		for ( x in it ) {
			if ( $p ) {
				count += 1;
			}
			i += 1;
		}
		count;
	}

	macro public static function each<X>( it: ExprOf<Iterable<X>>, f: Expr ) return macro {
		var it = $it;
		var i = 0;
		for ( x in it ) {
			$f;
			i += 1;
		}
	}
	
	macro public static function sum<X>( it: ExprOf<Iterable<X>>, ?init: ExprOf<X> ) return macro {
		var it = $it;
		var acc = $init;
		var iter = it.iterator();
		if ( acc == null ) acc = iter.next();
		for (x in iter) acc = acc + x;
		acc;
	}

	macro public static function select<X>( it: ExprOf<Iterable<X>>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var out = new Array();
		var i = 0;
		var j = 0;
		for (x in it) {
			if ( $p ) out.push( x ); else j += 1;
			i += 1;
		}
		out;
	}
	
	macro public static function reduce<X>( it: ExprOf<Iterable<X>>, f: ExprOf<X>, init: ExprOf<X> ) return macro {
		var it = $it;
		var acc = $init;
		var i = 0;	
		for (x in it) {
			acc = $f;
			i += 1;
		}
		acc;	
	}

	macro public static function apply<X>( it: ExprOf<Iterable<X>>, f: ExprOf<X> ) return macro {
		var it = $it;
		var out = new Array();
		var i = 0;
		for (x in it) {
			out.push( $f );
			i += 1;
		}
		out;
	}

	macro public static function applyselect<X>( it: ExprOf<Iterable<X>>, f: ExprOf<X>, p: ExprOf<Bool> ) return macro {
		var it = $it;
		var out = new Array();
		var i = 0;
		var j = 0;
		for (x in it) {
			x = $f;
			if ( $p ) out.push( x ); else j += 1;
			i += 1;
		}
		out;
	}

	macro public static function selectapply<X>( it: ExprOf<Iterable<X>>, p: ExprOf<Bool>, f: ExprOf<X> ) return macro {
		var it = $it;
		var out = new Array();
		var i = 0;
		var j = 0;
		for (x in it) {
			if ( $p ) out.push( $f ); else j += 1;
			i += 1;
		}
		out;
	}
}
