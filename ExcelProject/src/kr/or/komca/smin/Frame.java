package kr.or.komca.smin;

import java.awt.Color;
import java.awt.Dimension;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

class Frame {
 
  static JFrame frame;
    
 
  public Frame(){    
        
        
  frame = new JFrame("SMin's 4th Program in KMA");    
        JTabbedPane  jtab = new JTabbedPane();
        
        //JPanel panelFirst = new BinPanel();
        JPanel panelSecond = new SearchPanel();   
        //JPanel panelThird = new ExtensPanel();        
             
        

        
        //jtab.add("자료넣기", panelFirst);
        jtab.add("자료찾기", panelSecond);
        //jtab.add("", panelThird);
        

        
        
        frame.setLocation(350, 200); 
        // 가로, 세로
        frame.setSize(800,750);
        frame.add("Center",jtab);
        
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        
        // 시작시 팝업창
        //JOptionPane.showMessageDialog(null, "버튼은 한번씩만 눌러주시기 바랍니다." +"\n"+"CP");
        
        // 창크기 고정
        frame.setResizable(false);
        frame.setVisible(true);
        
    }




}