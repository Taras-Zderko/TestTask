package com.zderko.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zderko.entity.Employee;
import com.zderko.util.Util;

public class EmployeeDao extends Util {
	
	public static  int save(Employee employee) throws SQLException {
		int status = 0;
		String sql = "insert into employees(em_name,em_active,em_dp_id) values(?,?,?)";
		
		try(Connection connection = getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);){
				ps.setString(1, employee.getEm_name());
				ps.setBoolean(2, employee.isEm_active());
				ps.setString(3, employee.getEm_dp_id());
				status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return status;
	}
	
	public static  int update(Employee employee) throws SQLException{  
	    int status=0;  
	    String sql = "update employees set em_name=?,em_active=?,em_dp_id=? where em_id=?";
	    
	    try(Connection connection = getConnection();
	    	PreparedStatement ps=connection.prepareStatement(sql);){   
	        	ps.setString(1,employee.getEm_name());  
	        	ps.setBoolean(2,employee.isEm_active());  
	        	ps.setString(3,employee.getEm_dp_id());  
	        	ps.setInt(4,employee.getEm_id());  
	        	status=ps.executeUpdate();  
	    }catch(Exception e){
	    	e.printStackTrace();
	    	} 
	    return status;  
	}  
	
	public static  int delete(Employee employee) throws SQLException{  
	    int status=0;  
	    String sql = "delete from employees where em_id=?";
	    try(Connection connection = getConnection();
	    	PreparedStatement ps=connection.prepareStatement(sql);){  
	        	ps.setInt(1,employee.getEm_id());  
	        	status=ps.executeUpdate();  
	    }catch(Exception e){
	    	e.printStackTrace();
	    	} 
	    return status;  
	}  
	
	public static  List<Employee> getAllRecords(int limit,int offset) throws SQLException{  
	    List<Employee> list=new ArrayList<Employee>();  
	    String sql  = "select em_id, em_name, em_active, dp_name from employees left outer join departments on em_dp_id=dp_id order by em_id limit " +(limit-1) +","+offset;
	    	getList(list, sql);
	    return list;  
	}  

	public static List<Employee> Search(String em_name, int limit,int offset) throws SQLException{  
	    List<Employee> searchlist=new ArrayList<Employee>();
	    String sql  = "select em_id, em_name, em_active, dp_name from employees left outer join departments on em_dp_id=dp_id where em_name like '%"+ em_name +"%' order by em_id  limit " +(limit-1) + "," + offset;
	    	getList(searchlist, sql);
	    return searchlist;  
	}  
	
	//--------Не знаю чи оптимально так але дублювання не має---------//
	private static List<Employee> getList(List<Employee> list, String sql) {
		try(Connection connection = getConnection();
		   	PreparedStatement ps=connection.prepareStatement(sql);  
		    ResultSet rs=ps.executeQuery(); ){  
		    while(rs.next()){  
		       	Employee employee=new Employee();
		       	employee.setEm_id(rs.getInt("em_id"));  
		       	employee.setEm_name(rs.getString("em_name"));   
		       	employee.setEm_active(rs.getBoolean("em_active"));  
		       	employee.setEm_dp_id(rs.getString("dp_name"));  
		        list.add(employee);  
		        }  
		    }catch(Exception e){
		    	e.printStackTrace();
		   	}  
		return list;
	}
	//----------------------------------------------------------------//
	 
	public static Employee getRecordById(int em_id) throws SQLException{  
		Employee employee=null; 
		String sql = "select * from employees where em_id=?";
	    try(Connection connection = getConnection();
    		PreparedStatement ps=connection.prepareStatement(sql); ){   
	        ps.setInt(1,em_id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	employee=new Employee();  
	        	employee.setEm_id(rs.getInt("em_id"));  
	        	employee.setEm_name(rs.getString("em_name"));  
	        	employee.setEm_active(rs.getBoolean("em_active"));  
	        	employee.setEm_dp_id(rs.getString("em_dp_id"));  
	        }  
	    }catch(Exception e){
	    	e.printStackTrace();
	    	} 
	    return employee;  
	}  
	
	public static int getCountEmployee() throws SQLException{
		int count=0;
		String sql = "select count(*) as count from employees";
	    	count = getCount(count,sql);
	    return count;  
	}  
	
	public static int getCountSearch(String em_name) throws SQLException{
		int countSearch=0;
		String sql = "select count(*) as count from employees where em_name like '%"+ em_name +"%'";
	    	countSearch = getCount(countSearch, sql);
	    return countSearch;  
	} 
	
	private static int getCount(int count, String sql) {
		 try(Connection connection = getConnection();
			 PreparedStatement ps=connection.prepareStatement(sql);  
			 ResultSet resultSet =ps.executeQuery();){
			 	resultSet.next();
			 	count = resultSet.getInt("count");
		 }catch(Exception e){
		   	e.printStackTrace();
		   	}
		 return count;
	}
}
