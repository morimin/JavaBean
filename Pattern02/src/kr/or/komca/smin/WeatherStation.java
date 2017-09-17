package kr.or.komca.smin;

public class WeatherStation {

	public static void main(String[] args) {
		// 작동을 데이터 값이 필요한 WeatherData객체생성		
		WeatherData weatherData = new WeatherData();
			
		// WeatherData 객체의 값을 받기위해 CurrentConditionsDisplay에 지정한 Constructor객체를 생성
		new CurrentConditionsDisplay(weatherData);

		// 값을 변경해 보자.
		weatherData.setMeasurements(80, 65, 30.4f);
		weatherData.setMeasurements(82, 70, 29.2f);
		weatherData.setMeasurements(78, 90, 29.2f);
		
	}

}
