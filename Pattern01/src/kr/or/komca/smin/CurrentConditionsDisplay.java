package kr.or.komca.smin;

public class CurrentConditionsDisplay implements Observer, DisplayElement{
	/*
	 * Observer ; WeatherData 객체로부터 변경사항을 받기위해 다중상속(implement) -> update() 必
	 * DisplayElement ; API 구조상 모든 디스플레이 항목에서 DisplayElement를 구현해야 하기 때문에 다중상속(implement) -> display() 必 
	 *  
	 * */
	
	private float temperature;
	private float humidity;
	private Subject weatherData;
	
	public CurrentConditionsDisplay(Subject weatherData){
		// Constructor에 객체가 전달됨. 
		// 이 객체를 써서 디스플레이를 옵저버로 등록함 
		this.weatherData = weatherData;
		weatherData.registerObserver(this);
		
	}
	
	@Override
	public void update(float temperature, float humidity, float pressure) {
		// update가 호출 되어 변수로 저장되고 마지막 라인에서 display() 호출
		this.temperature = temperature;
		this.humidity = humidity;
		display();
				
	}
	
	@Override
	public void display() {
		// 변수에 저장된 값을 나타내어 준다.
		System.out.println("Current conditions : " + temperature + " F degree and " + humidity + " % humidity");		
	}

	
	
	

}




