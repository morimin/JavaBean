package kr.or.komca.smin;

import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;

public class WeatherData extends Observable{
	
	private ArrayList observers;
	private float temperature;
	private float humidity;
	private float pressure;
		
	public WeatherData(){	}
	
	public void measurementsChanged(){
		setChanged();		
		notifyObservers();
		
	}
	
	public void setMeasurements(float temperature, float humidity, float pressure){
		// 값들을 지정해주는 메소드
		this.temperature = temperature;
		this.humidity = humidity;
		this.pressure = pressure;
		measurementsChanged();
		
	}

	public float getTemperature() { return temperature; }

	public float getHumidity() { return humidity; }

	public float getPressure() { return pressure; }


}//MAIN




