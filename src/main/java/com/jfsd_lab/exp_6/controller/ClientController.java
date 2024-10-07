package com.jfsd_lab.exp_6.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd_lab.exp_6.model.Event;
import com.jfsd_lab.exp_6.model.User;
import com.jfsd_lab.exp_6.service.EventService;
import com.jfsd_lab.exp_6.service.UserService;

@Controller
public class ClientController {

	@Autowired
	private UserService userService;

	@Autowired
	private EventService eventService;

	@GetMapping("/")
	public ModelAndView homePage() {
		return new ModelAndView("home");
	}

	@GetMapping("/home")
	public ModelAndView homeRedirect() {
		return homePage();
	}

	@GetMapping("/add-user")
	public ModelAndView addUserView() {
		return new ModelAndView("add-user");
	}

	@GetMapping("/user-dashboard")
	public ModelAndView userDashView() {
		return new ModelAndView("redirect:/user-dashboard");
	}

	@PostMapping("/add-user")
	public ModelAndView addUser(@ModelAttribute User user) {
		HttpStatus status = userService.addUser(user);

		ModelAndView modelAndView;
		if (status == HttpStatus.CREATED) {
			modelAndView = new ModelAndView("login");
			modelAndView.addObject("message",
					"User ID created successfully with ID and name: " + user.getId() + " " + user.getName());
		} else {
			modelAndView = new ModelAndView("add-user");
			modelAndView.addObject("message", "Failed to add user.");
		}
		return modelAndView;
	}

	@GetMapping("/create-admin")
	public ModelAndView createAdminView() {
		return new ModelAndView("create-admin");
	}

	@PostMapping("/create-admin")
	public ModelAndView createAdmin(@ModelAttribute User user) {
		user.setAdmin(true);
		HttpStatus status = userService.addAdmin(user);
		ModelAndView mv;
		if (status == HttpStatus.CREATED) {
			mv = new ModelAndView("login");
			mv.addObject("message",
					"User ID created successfully with ID and name: " + user.getId() + " " + user.getName());
		} else {
			mv = new ModelAndView("create-admin");
			mv.addObject("message", "There has been some error creating an admin.");
		}
		return mv;
	}

	@GetMapping("/login")
	public ModelAndView loginView() {
	    return new ModelAndView("login");
	}

	@PostMapping("/login")
	public ModelAndView login(@ModelAttribute("user") User loginUser, HttpServletRequest request) {
	    boolean isAuthenticated = userService.authenticate(loginUser.getUsername(), loginUser.getPassword());

	    ModelAndView modelAndView;
	    if (isAuthenticated) {
	        User user = userService.getUserByUsername(loginUser.getUsername());

	        // Store the user in session
	        request.getSession().setAttribute("user", user);

	        // Redirect to home2.jsp for both admin and regular users
	        modelAndView = new ModelAndView("home2");
	        modelAndView.addObject("message", "Welcome, " + user.getName() + "!");
	    } else {
	        modelAndView = new ModelAndView("login");
	        modelAndView.addObject("message", "Invalid username or password.");
	    }

	    return modelAndView;
	}


	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		// Invalidate the session
		session.invalidate();

		// Redirect to login page with a message
		ModelAndView modelAndView = new ModelAndView("login");
		modelAndView.addObject("message", "You have successfully logged out.");
		return modelAndView;
	}

	@GetMapping("/add-event")
	public ModelAndView addEventView() {
		List<User> allUsers = userService.getAllUsers(); // fetch all users from UserService
		ModelAndView mv = new ModelAndView("add-event");
		mv.addObject("allUsers", allUsers);
		mv.addObject("event", new Event());
		return mv;
	}

	@PostMapping("/add-event")
	public ModelAndView addEvent(@ModelAttribute Event event, HttpServletRequest request) {
		HttpStatus status = eventService.createEvent(event);
		ModelAndView mv;
		if (status == HttpStatus.CREATED) {
			// Redirect to admin dashboard after successful event creation
			mv = new ModelAndView("redirect:/admin-dashboard");
			request.getSession().setAttribute("message",
					"Event created successfully with ID and title: " + event.getId() + " " + event.getTitle());
		} else {
			mv = new ModelAndView("add-event");
			mv.addObject("message", "There has been some error creating an event.");
		}
		return mv;
	}

	@GetMapping("/admin-dashboard")
	public ModelAndView adminDashView() {
		return new ModelAndView("admin-dashboard");
	}

	@GetMapping("/manage-events")
	public ModelAndView manageEventsView() {
		ModelAndView mv = new ModelAndView("manage-events");
		List<Event> allEvents = eventService.getAllEvents(); // Fetch all events
		mv.addObject("allEvents", allEvents); // Add events to the model
		return mv;
	}

	// EDIT Event - GET (load event details for editing)
	@GetMapping("/editEvent/{id}")
	public ModelAndView editEventView(@PathVariable("id") int eventId) {
		Event event = eventService.getEventById(eventId); // Fetch the event by ID
		ModelAndView mv = new ModelAndView("edit-event");
		mv.addObject("allUsers", userService.getAllUsers()); // Add this line
		mv.addObject("event", event); // Pass the whole event object to the view
		return mv;
	}

	@PostMapping("/editEvent/{id}")
	public ModelAndView editEvent(@PathVariable("id") int eventId, @ModelAttribute Event updatedEvent,
			HttpServletRequest request) {
		updatedEvent.setId(eventId);
		HttpStatus status = eventService.updateEvent(updatedEvent);
		ModelAndView mv;
		if (status == HttpStatus.OK) {
			mv = new ModelAndView("redirect:/manage-events");
			request.getSession().setAttribute("message", "Event updated successfully: " + updatedEvent.getTitle());
		} else {
			mv = new ModelAndView("edit-event");
			mv.addObject("message", "Error updating the event.");
			mv.addObject("event", updatedEvent);
			mv.addObject("allUsers", userService.getAllUsers()); // Add this line
		}
		return mv;
	}

	// DELETE Event
	@GetMapping("/deleteEvent/{id}")
	public ModelAndView deleteEvent(@PathVariable("id") int eventId, HttpServletRequest request) {
		HttpStatus status = eventService.deleteEvent(eventId); // Delete the event by ID
		ModelAndView mv;
		if (status == HttpStatus.OK) {
			// Redirect to manage events after successful deletion
			mv = new ModelAndView("redirect:/manage-events");
			request.getSession().setAttribute("message", "Event deleted successfully.");
		} else {
			mv = new ModelAndView("manage-events");
			mv.addObject("message", "Error deleting the event.");
		}
		return mv;
	}

	// User Register events view
	@GetMapping("/register-events")
	public ModelAndView registerEventView() {
		ModelAndView mv = new ModelAndView("register-events");
		List<Event> allEvents = eventService.getAllEvents(); // Fetch all events
		mv.addObject("allEvents", allEvents); // Add events to the model
		return mv;
	}

	@GetMapping("/registerEvent/{eventId}")
	public ModelAndView registerEvent(@PathVariable("eventId") int eventId, HttpSession session) {
		ModelAndView mv = new ModelAndView("register-events");

		User user = (User) session.getAttribute("user"); // Get the logged-in user from session
		if (user != null) {
			HttpStatus status = eventService.registerUserToEvent(eventService.getEventById(eventId), user);
			if (status == HttpStatus.OK) {
				mv.addObject("message", "You have successfully registered for the event.");
			} else if (status == HttpStatus.NOT_FOUND) {
				mv.addObject("message", "Event not found.");
			} else {
				mv.addObject("message", "Error occurred while registering for the event. Please try again.");
			}
		} else {
			mv.addObject("message", "Please login to register for an event.");
		}

		// Fetch the updated list of events to display after registration attempt
		mv.addObject("allEvents", eventService.getAllEvents());
		return mv;
	}

	@GetMapping("/registered-events")
	public ModelAndView viewRegisteredEvents(HttpSession session) {
		User user = (User) session.getAttribute("user"); // Get the logged-in user
		if (user != null) {
			List<Event> registeredEvents = eventService.getRegisteredEventsForUser(user); // Fetch events by user
			ModelAndView mv = new ModelAndView("registered-events"); // Load the JSP view
			mv.addObject("registeredEvents", registeredEvents); // Pass the registered events to the view
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("message", "Please log in to view registered events.");
			return mv;
		}
	}

}
