package kr.or.komca.smin;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		
		BufferedReader in;
		//FileReader in =null;
		
		try{
			
			in = new BufferedReader(new FileReader("C:/Users/user/Desktop/sample.txt"));
			String summ;
			
			
			while( (summ = in.readLine()) != null ){
										
				if(summ.substring(1,2).equals("I")){
					
					Switchh(summ.substring(14, 15));					
					
				}else{

					Switchh(summ.substring(13, 14));
					
				}// if				
				
			}// while
			
			in.close();
						
			
		}catch(Exception e){
			
			System.out.println(" [ Error 1 ] getStackTrace() = " + e.getStackTrace());
			System.out.println(" [ Error 1 ] getMessage() = " + e.getMessage());
			
		}//Try~Catch for last shell		
		

	}// main
	
	private static void Switchh(String word){
		
		RecordType rt = null;
	
		switch(word){
		
			case "7" : rt = new RecordType(word, 7); rt.printType7(); break ;
			case "6" : rt = new RecordType(word, 6); rt.printType6(); break ;
			case "5" : rt = new RecordType(word, 5); rt.printType5(); break ;	
			case "4" : rt = new RecordType(word, 4); rt.printType4(); break ;	
			case "3" : rt = new RecordType(word, 3); rt.printType3(); break ;	
			case "2" : rt = new RecordType(word, 2); rt.printType2(); break ;	
			case "1" : rt = new RecordType(word, 1); rt.printType1(); break ;			
			
			default : System.out.println("[ DEFAULT ] = " +  word); break ;
		
		}
	}

}// Main
