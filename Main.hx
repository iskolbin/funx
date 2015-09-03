using Funx;

class Main {
	public static function main() {
		var x = ( [1,2,3,4].xmap(x+1).xmap(x*2));
		trace( x );
		trace( [15=> 4, 32 => 3].kxmap(x*5));
	}
}
