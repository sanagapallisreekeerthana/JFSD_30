package com.jfsd_lab.exp_6.dao;

import java.util.List;

import org.springframework.http.HttpStatus;

import com.jfsd_lab.exp_6.model.User;

public interface UserDAO {

	public HttpStatus addUser(User user);

	public HttpStatus addAdmin(User admin);

	User findByUsername(String username);

	public List<User> getAllUsers();

}
