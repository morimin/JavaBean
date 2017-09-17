package kr.or.komca.smin;

public interface Subject {

	/* Observer를 인자로 받아서 등록 하는 역할 */ 
	public void registerObserver(Observer o);
	/* Observer를 인자로 받아서 제거 하는 역할 */
	public void removeObserver(Observer o);
	
	/* 주제 객체의 상태가 변병되었을 때 모든 옵저버들에게 알리기 위해 호출되는 메소드 */
	public void notifyObservers();	

}



