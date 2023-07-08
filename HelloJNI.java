public class HelloJNI {
	static {
		System.loadLibrary("chello");
		System.loadLibrary("cpphello");
	}

	private native void sayHello();

	private native void sayHelloFromCpp();

	public static void main(String args[]){
		HelloJNI hj = new HelloJNI();
		hj.sayHello();
		hj.sayHelloFromCpp();
	}
}