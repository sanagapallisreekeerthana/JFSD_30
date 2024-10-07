package com.jfsd_lab.exp_6.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false, unique = true)
	private String title;

	private String description;

	private int amnt;

	// Relationship with the resource person (User)
	@ManyToOne
	@JoinColumn(name = "resource_person_id", referencedColumnName = "id")
	private User resourcePerson;

	// Relationship with the registered users (User)
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "event_registered_users", joinColumns = @JoinColumn(name = "event_id"), inverseJoinColumns = @JoinColumn(name = "registered_user_id"))
	private List<User> registeredUsers;

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAmnt() {
		return amnt;
	}

	public void setAmnt(int amnt) {
		this.amnt = amnt;
	}

	public User getResourcePerson() {
		return resourcePerson;
	}

	public void setResourcePerson(User resourcePerson) {
		this.resourcePerson = resourcePerson;
	}

	public List<User> getRegisteredUsers() {
		return registeredUsers;
	}

	public void setRegisteredUsers(List<User> registeredUsers) {
		this.registeredUsers = registeredUsers;
	}
}
