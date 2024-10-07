package com.jfsd_lab.exp_6.dao;

import java.util.List;

import org.springframework.http.HttpStatus;

import com.jfsd_lab.exp_6.model.Event;
import com.jfsd_lab.exp_6.model.User;

public interface EventsDAO {

	public HttpStatus createEvent(Event e);

	public HttpStatus registerUserToEvent(Event e, User user);

	public List<User> getUsersRegisteredToEvent(Event e);

	public Event getEventById(int eventId);

	public List<Event> getAllEvents();

	public HttpStatus deleteEvent(int eventId);

	public HttpStatus updateEvent(Event updatedEvent);

	public List<Event> getRegisteredEventsByUser(User user);
}
