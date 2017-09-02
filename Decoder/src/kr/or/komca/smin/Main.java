package kr.or.komca.smin;

import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		
		FileReader in =null;
		
		try{
			
			in = new FileReader("C:/Users/user/Desktop/sample.txt");
										
			int readcomm;
			char chaRead;
			String comm;
			ArrayList arrList = new ArrayList();
			ArrayList arrList2 = new ArrayList();
			
			RecordType rt = null;

			
			while( (readcomm = in.read() ) != -1){

				chaRead = (char)readcomm;
				
				comm = String.valueOf(chaRead);
				
				arrList.add(comm);
				

			}// while			
			
			System.out.println(arrList.size() -1);
			
			String sum = "";
			
				
			for (int i = 0 ; i <= arrList.size() -1 ; i++){								
					
				sum += arrList.get(i).toString();
					
			}
			//System.out.println("sum = " + sum);
			int cntt=1;			
			int plus = 362;
			
			while(true){
				
				if(cntt >= sum.length() -1 ) {
					break;
				}else{
					if(cntt ==1){
						arrList2.add(sum.substring(cntt, cntt + plus  ));
						
						cntt = cntt + plus;
					}else{
						arrList2.add(sum.substring(cntt +2, cntt + plus  ));
						
						cntt = cntt + plus;	
					}							
										
				}			

			}//무한루프
			
			for(int i = 0 ; i <= arrList2.size() -1 ; i++){
				
				switch(arrList2.get(i).toString().substring(13,14)){
				
				/*
				 * 
				 * 
				 * RecordType 객체내의 printType()메소드에 지금은 출력하는 함수 넣지만 디비로 밀어넣는 메소드 넣으면 완성 됩니다.
				 * 
				 * 
				 * 
				 * */
					
					case "7" : rt = new RecordType(arrList2.get(i).toString(), 7); rt.printType7(); break ;
					case "6" : rt = new RecordType(arrList2.get(i).toString(), 6); rt.printType6(); break ;
					case "5" : rt = new RecordType(arrList2.get(i).toString(), 5); rt.printType5(); break ;	
					case "4" : rt = new RecordType(arrList2.get(i).toString(), 4); rt.printType4(); break ;	
					case "3" : rt = new RecordType(arrList2.get(i).toString(), 3); rt.printType3(); break ;	
					case "2" : rt = new RecordType(arrList2.get(i).toString(), 2); rt.printType2(); break ;	
					case "1" : rt = new RecordType(arrList2.get(i).toString(), 1); rt.printType1(); break ;			
					
					default : System.out.println("f1 = " +  arrList2.get(i).toString()); break ;
				
				}// switch
				
				
			}// For 문 for 리스트
			
			
						
			arrList2.clear();
			in.close();			
			
		}catch(Exception e){
			
			System.out.println(" [ Error 1 ] getStackTrace() = " + e.getStackTrace());
			System.out.println(" [ Error 1 ] getMessage() = " + e.getMessage());
			
		}//Try~Catch for last shell		
		

	}// main

}// Main
