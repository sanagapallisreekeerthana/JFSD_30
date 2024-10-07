package com.jfsd_lab.exp_6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jfsd_lab.exp_6.dao.EventsDAO;
import com.jfsd_lab.exp_6.model.Event;
import com.jfsd_lab.exp_6.model.User;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventsDAO eventsDAO;

	@Override
	@Transactional
	public HttpStatus createEvent(Event e) {
		return eventsDAO.createEvent(e);
	}

	@Override
	@Transactional
	public HttpStatus registerUserToEvent(Event e, User user) {
		return eventsDAO.registerUserToEvent(e, user);
	}

	@Override
	public List<User> getUsersRegisteredToEvent(Event e) {
		return eventsDAO.getUsersRegisteredToEvent(e);
	}

	@Override
	public Event getEventById(int eventId) {
		return eventsDAO.getEventById(eventId);
	}

	@Override
	public List<Event> getAllEvents() {
		return eventsDAO.getAllEvents();
	}

	@Override
	public HttpStatus deleteEvent(int eventId) {
		return eventsDAO.deleteEvent(eventId);
	}

	@Override
	public HttpStatus updateEvent(Event updatedEvent) {
		return eventsDAO.updateEvent(updatedEvent);
	}

	@Override
	public List<Event> getRegisteredEventsForUser(User user) {
		return eventsDAO.getRegisteredEventsByUser(user);
	}
}
