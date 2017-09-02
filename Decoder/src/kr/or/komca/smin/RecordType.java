package kr.or.komca.smin;

import java.util.ArrayList;

public class RecordType {
	String bncd;
	
	String comm;
	int type;
	
	ArrayList arrList = new ArrayList<>();
	
	public RecordType(){
		
	}
	
	public RecordType(String comm, int type) {
		this.comm = comm;
		this.type = type;
	}
	
	public void printType7(){		
		
		System.out.println("type "+ type +" 입니다. = "+ "\n" + comm);				
	
	}//printType7
	
	public void printType1(){		
		
		System.out.println("type "+ type +" 입니다. = "+ "\n" + comm);	
					
	}//printType1
	
	public void printType2(){		
		
		System.out.println("type "+ type +" 입니다. = "+ "\n" + comm);	
		
	}//printType2
	
	public void printType3(){		
		
		System.out.println("type "+ type +" 입니다. = "+ "\n" + comm);	
					
	}//printType3
	
	public void printType4(){		
		
		System.out.println("type "+ type +" 입니다. = "+ "\n" + comm);	
					
	}//printType4
	
	public void printType5(){		
		
		System.out.println("type "+ type +" 입니다. = "+ "\n" + comm);	
					
	}//printType5
	
	public void printType6(){		
		
		System.out.println("type "+ type +" 입니다. = "+ "\n" + comm);	
					
	}//printType6
	
	
}//Main


