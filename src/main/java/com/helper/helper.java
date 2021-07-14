package com.helper;

public class helper {

	public static String get10Words(String str)
	{
		String arr[]=str.split(" ");
		if(arr.length >10)
		{
			String ans="";
			for(int i=0;i<10;i++)
			{
				ans+=arr[i]+" ";
			}
			return ans+"...........";
		}
		else
		{
			return str+".....";
		}
	}
}
