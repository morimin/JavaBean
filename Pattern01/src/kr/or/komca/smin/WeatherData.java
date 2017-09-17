package kr.or.komca.smin;

import java.util.ArrayList;

public class WeatherData implements Subject{
	
	private ArrayList observers;
	private float temperature;
	private float humidity;
	private float pressure;
	
	public WeatherData(){		
		//WeatherData()를 객체를 생성하면 리스트를 만든다.		   
		observers = new ArrayList();
		
	}
	
	@Override
	public void registerObserver(Observer o){
		// 옵저버가 등록하면 리스트 맨뒤에 추가 됨
		observers.add(o);
		
	}
	
	@Override
	public void removeObserver(Observer o){
		// 옵저버가 탈퇴를 신청하면 리스트에서 제거
		int i = observers.indexOf(o);
		if (i >= 0){
			observers.remove(i);
			
		}// if
		
	}
	
	public void notifyObservers(){
		// 상태에 대해 모든 옵저버들에게 알려주는 부분
		// 따라서, update해줘야함.
		for(int i = 0 ; i <= observers.size() -1 ; i++){
			Observer observer = (Observer)observers.get(i);
			observer.update(temperature, humidity, pressure);			
		}//for
	}
	
	public void measurementsChanged(){
		// WeatherStation으로 부터 갱신된 측정치를 받으면 옵저버들에게 update로 알림.
		notifyObservers();
		
	}
	
	public void setMeasurements(float temperature, float humidity, float pressure){
		// 값들을 지정해주는 메소드
		this.temperature = temperature;
		this.humidity = humidity;
		this.pressure = pressure;
		measurementsChanged();
		
	}
	//기타 메소드s

	

	
}//MAIN




