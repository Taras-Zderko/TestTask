package com.zderko.dao;

import java.sql.*;
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
			System.out.println(e);
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
	    	System.out.println(e);
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
	    	System.out.println(e);
	    	} 
	    return status;  
	}  
	
	public static  List<Employee> getAllRecords(int limit,int offset) throws SQLException{  
	    List<Employee> list=new ArrayList<Employee>();  
	    String sql  = "select em_id, em_name, em_active, dp_name from employees left outer join departments on em_dp_id=dp_id order by em_id limit " +(limit-1) +","+offset;
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
	    	System.out.println(e);
	    	}  
	    return list;  
	}  
	
	public static List<Employee> Search(String em_name, int limit,int offset) throws SQLException{  
	    List<Employee> searchlist=new ArrayList<Employee>();
	    String sql  = "select em_id, em_name, em_active, dp_name from employees left outer join departments on em_dp_id=dp_id where em_name like '%"+ em_name +"%' order by em_id  limit " +(limit-1) + "," + offset;
	    try(Connection connection = getConnection();
	    	PreparedStatement ps=connection.prepareStatement(sql);    
		    ResultSet rs=ps.executeQuery(); ){   
	        while(rs.next()){  
	        	Employee employee=new Employee();
	        	employee.setEm_id(rs.getInt("em_id"));  
	        	employee.setEm_name(rs.getString("em_name"));   
	        	employee.setEm_active(rs.getBoolean("em_active"));  
	        	employee.setEm_dp_id(rs.getString("dp_name"));  
	        	searchlist.add(employee);  
	        }  
	    }catch(Exception e){
	    	System.out.println(e);
	    	}  
	    return searchlist;  
	}  
	
	public static int getCountEmployee(int total) throws SQLException{
		int count=0;
		String sql = "select count(*) as count from employees";
	    try(Connection connection = getConnection();
	    	PreparedStatement ps=connection.prepareStatement(sql);  
		    ResultSet resultSet =ps.executeQuery();){
	        resultSet.next();
	        count = resultSet.getInt("count")/total;
	    }catch(Exception e){
	    	System.out.println(e);
	    	}  
	    return count;  
	}  
	
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
	    	System.out.println(e);
	    	} 
	    return employee;  
	}  
	
}
