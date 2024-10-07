package com.jfsd_lab.exp_6.service;

import java.util.List;

import org.springframework.http.HttpStatus;

import com.jfsd_lab.exp_6.model.Event;
import com.jfsd_lab.exp_6.model.User;

public interface EventService {

	public HttpStatus createEvent(Event e);

	public HttpStatus registerUserToEvent(Event e, User user);

	public List<User> getUsersRegisteredToEvent(Event e);

	public Event getEventById(int eventId);

	public List<Event> getAllEvents();


	public HttpStatus updateEvent(Event updatedEvent);

	public HttpStatus deleteEvent(int eventId);

	public List<Event> getRegisteredEventsForUser(User user);

}
