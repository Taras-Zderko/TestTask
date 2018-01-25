package com.zderko.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetFactory;
import javax.sql.rowset.RowSetProvider;

import com.zderko.entity.Department;
import com.zderko.util.Util;

public class DepartmentDao extends Util {
	
	public static List<Department> getAllRecords() throws SQLException{  
	    List<Department> deplist=new ArrayList<>(); 
	    String sql = "select * from departments";
	      
	    try(Connection connection = getConnection();
	    	PreparedStatement ps=connection.prepareStatement(sql);  
		    ResultSet rs=ps.executeQuery();){
	    	
	    	//-----------------кешування-------------------//	
	    	RowSetFactory factory = RowSetProvider.newFactory();
	    	CachedRowSet cachedRowSet = factory.createCachedRowSet();
	    	cachedRowSet.populate(rs);
	    	//---------------------------------------------//
	    	
	        while(cachedRowSet.next()){  
	        	Department department = new Department();
	        	department.setDp_id(cachedRowSet.getInt("dp_id"));  
	        	department.setDp_name(cachedRowSet.getString("dp_name"));   
	        	deplist.add(department);  
	        }  
	    }catch(Exception e){
	    	e.printStackTrace();
			}
	    return deplist;  
	}  
}
