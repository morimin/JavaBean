package kr.or.komca.smin;

public interface Observer {
	
	/* 모든 옵저버 클래스에서 구현되어야 한다. 
	 * 따라서 모든 옵저버에서 아래의 update메소드를 구현해야 한다.
	 *  */
	public void update (float temp, float humidity, float pressure);

}
