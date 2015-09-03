using Funx;

class Main {
	public static function dosmth( a: Array<Int> ) {
		var x = a.xmap( 2+x );
		return x;
	}
	
	public static function main() {
		var x = ( [1,2,3,4].xmap(x+1).xmap(x*2));
		trace( x );
		trace( [15=> 4, 32 => 3].kxmap(x*5));
		var y = dosmth( [4,5,6,7,8] );
		trace( y );
	}
}
