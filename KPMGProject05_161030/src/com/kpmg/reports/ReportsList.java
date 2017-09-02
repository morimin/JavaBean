package com.kpmg.reports;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReportsList {
	
	private ArrayList<String> distingList = new ArrayList<String>();
	private ArrayList<Integer> idxList = new ArrayList<Integer>();
	private ArrayList<Date> ymdList = new ArrayList<Date>();
	private ArrayList<Date> sdList = new ArrayList<Date>();
	private ArrayList<String> sortList = new ArrayList<String>();
	private ArrayList<String> timesList = new ArrayList<String>();
	private ArrayList<String> titleList = new ArrayList<String>();
	private ArrayList<String> urlList = new ArrayList<String>();	
	
	
	private boolean lastpage = false;
	
	/* Setters */
	public void setDisting(String disting)
	{
		this.distingList.add(disting);		
	}
	public void setIdx(Integer idx)
	{
		this.idxList.add(idx);
	}	
	public void setYmd(Date ymd)
	{
		this.ymdList.add(ymd);
	}	
	public void setSd(Date search_date)
	{
		this.sdList.add(search_date);
	}	
	public void setSort(String sort)
	{
		this.sortList.add(sort);		
	}	
	public void setTimes(String times)
	{
		this.timesList.add(times);
	}	
	public void setTitle(String title)
	{
		this.titleList.add(title);		
	}
	public void setUrl(String url)
	{
		this.urlList.add(url);
	}
	
	/*Getters*/
	public String[] getDisting()
	{
		return distingList.toArray( new String[distingList.size()]);
	}
	public Integer[] getIdx()
	{
		return idxList.toArray( new Integer[idxList.size()]);
	}
	public Date[] getYmd()
	{
		return ymdList.toArray( new Date[ymdList.size()]);
	}
	public Date[] getSearch_date()
	{
		return sdList.toArray( new Date[sdList.size()]);
	}
	public String[] getSort()
	{
		return sortList.toArray( new String[sortList.size()]);
	}
	public String[] getTimes()
	{
		return timesList.toArray( new String[timesList.size()]);
	}
	public String[] getTitle()
	{
		return titleList.toArray( new String[titleList.size()]);
	}
	public String[] getUrl()
	{
		return urlList.toArray( new String[urlList.size()]);
	}
	
	
	public boolean isLastpage()
	{
		return lastpage;
	}
	public void setLastpage(boolean lastpage)
	{
		this.lastpage = lastpage;
	}
	
	

	/* 현재 게시글 수를 리턴해주는 메소드*/
	public int getListSize()
	{
		return idxList.size();
	}


	
	
}// ReportsList Class








