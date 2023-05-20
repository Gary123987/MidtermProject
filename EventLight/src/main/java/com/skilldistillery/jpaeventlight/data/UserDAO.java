package com.skilldistillery.jpaeventlight.data;

import java.util.List;

import com.skilldistillery.jpaeventlight.entities.Artist;
import com.skilldistillery.jpaeventlight.entities.Band;
import com.skilldistillery.jpaeventlight.entities.Event;
import com.skilldistillery.jpaeventlight.entities.User;
import com.skilldistillery.jpaeventlight.entities.Venue;

public interface UserDAO {
	
	User findByUsernameAndPassword(String username, String password);

	List<Event> findAllEvents();

	Event createEvent(Event event);

	Venue createVenue(Venue venue);

	Artist createArtist(Artist artist);

	Band createBand(Band band);

	boolean deleteEvent(int eventId);

	boolean deleteVenue(int venueId);

	boolean deleteBand(int bandId);

	boolean deleteArtist(int artistId);

	User signUp(User user);

	boolean deleteUser(int userId);

	Event updateEvent(int eventId, Event updatedEvent);

	Venue updateVenue(int venueId, Venue updatedVenue);

	
	
	

}
