package com.jfsd_lab.exp_6.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.jfsd_lab.exp_6.model.Event;
import com.jfsd_lab.exp_6.model.User;

public class EventsDAO_Impl implements EventsDAO {

	private HibernateTemplate ht;

	public HibernateTemplate getHt() {
		return ht;
	}

	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

	@Override
	@Transactional
	public HttpStatus createEvent(Event e) {
		try {
			ht.saveOrUpdate(e);
			return HttpStatus.CREATED;
		} catch (Exception ex) {
			System.out.println("Error creating event: " + ex.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}
	}

	@Override
	@Transactional
	public HttpStatus registerUserToEvent(Event e, User user) {
		try {
			// Ensure the list of registered users is initialized
			if (e.getRegisteredUsers() == null) {
				e.setRegisteredUsers(new ArrayList<>());
			}

			// Add the user to the list of registered users
			e.getRegisteredUsers().add(user);

			// Save or update the event
			ht.saveOrUpdate(e);

			return HttpStatus.OK;
		} catch (Exception ex) {
			System.out.println("Error registering user to event: " + ex.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}
	}

	@Override
	public List<User> getUsersRegisteredToEvent(Event e) {
		try {
			return ht.loadAll(User.class).stream()
					.filter(user -> e.getRegisteredUsers().stream()
							.anyMatch(registeredUser -> registeredUser.getId() == user.getId()))
					.collect(Collectors.toList());
		} catch (Exception ex) {
			System.out.println("Error fetching users registered to event: " + ex.getMessage());
			return null;
		}
	}

	@Override
	public Event getEventById(int eventId) {
		try {
			return ht.get(Event.class, eventId);
		} catch (Exception ex) {
			System.out.println("Error fetching event by ID: " + ex.getMessage());
			return null;
		}
	}

	@Override
	public List<Event> getAllEvents() {
		return ht.loadAll(Event.class);
	}

	@Override
	@Transactional
	public HttpStatus deleteEvent(int eventId) {
		try {
			Event event = ht.get(Event.class, eventId); // Fetch the event by ID
			if (event != null) {
				ht.delete(event); // Delete the event if it exists
				return HttpStatus.OK;
			} else {
				return HttpStatus.NOT_FOUND; // Event not found
			}
		} catch (Exception ex) {
			System.out.println("Error deleting event: " + ex.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR; // Handle any exceptions
		}
	}

	@Override
	@Transactional
	public HttpStatus updateEvent(Event updatedEvent) {
		try {
			Event existingEvent = ht.get(Event.class, updatedEvent.getId()); // Fetch the existing event by ID
			if (existingEvent != null) {
				// Update event details with the values from updatedEvent
				existingEvent.setTitle(updatedEvent.getTitle());
				existingEvent.setDescription(updatedEvent.getDescription());
				existingEvent.setAmnt(updatedEvent.getAmnt());
				existingEvent.setResourcePerson(updatedEvent.getResourcePerson());
				existingEvent.setRegisteredUsers(updatedEvent.getRegisteredUsers());

				ht.update(existingEvent); // Save the updated event
				return HttpStatus.OK;
			} else {
				return HttpStatus.NOT_FOUND; // Event not found
			}
		} catch (Exception ex) {
			System.out.println("Error updating event: " + ex.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR; // Handle any exceptions
		}
	}

	@Override
	public List<Event> getRegisteredEventsByUser(User user) {
		return ht.execute(session -> {
			String hql = "select e from Event e join e.registeredUsers u where u.id = :userId";
			return session.createQuery(hql, Event.class).setParameter("userId", user.getId()).getResultList();
		});
	}

}
