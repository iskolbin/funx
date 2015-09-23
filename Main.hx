using ArrayFunx;

class Main {
	public static function main() {
		var y = [ for ( i in 0...10) i].applyI(x+1).selectI(x<9).applyselectI(x-1,x>2).reversedI();
		trace( y );
	}
}
