package kr.or.komca.smin;

import java.util.Observable;
import java.util.Observer;

public class CurrentConditionsDisplay implements Observer, DisplayElement{

	Observable observable ;
	private float temperature;
	private float humidity;
	
	
	public CurrentConditionsDisplay(Observable observable){
		this.observable = observable;
		observable.addObserver(this);
		
	}
	
	@Override
	public void update(Observable obs, Object arg){
		
		if( obs instanceof WeatherData ){
			WeatherData weatherData = (WeatherData) obs;
			this.temperature = weatherData.getTemperature();
			this.humidity = weatherData.getHumidity();
			display();
		}// if		
						
	}// update
	
	@Override
	public void display() {
		// 변수에 저장된 값을 나타내어 준다.
		System.out.println("Current conditions : " + temperature + " F degree and " + humidity + " % humidity");		
	}

}// MAIN




