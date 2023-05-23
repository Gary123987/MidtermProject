package com.skilldistillery.jpaeventlight.data;

import java.util.List;

import com.skilldistillery.jpaeventlight.entities.Address;
import com.skilldistillery.jpaeventlight.entities.Artist;
import com.skilldistillery.jpaeventlight.entities.Band;
import com.skilldistillery.jpaeventlight.entities.Event;
import com.skilldistillery.jpaeventlight.entities.User;
import com.skilldistillery.jpaeventlight.entities.Venue;

public interface UserDAO {
	
	User findByUsernameAndPassword(String username, String password);

	List<Event> findAllEvents();

	Event createEvent(Event event);

	Artist createArtist(Artist artist);

	Band createBand(Band band);

	boolean deleteEvent(int eventId);

	boolean deleteVenue(int venueId);

	boolean deleteBand(int bandId);

	boolean deleteArtist(int artistId);

	boolean deleteUser(int userId);

	Event updateEvent(Event updatedEvent);

	User signUp(User user, Address address);

	Venue createVenue(Venue venue, Address address);

	Venue updateVenue(Venue updatedVenue);

	Address updateAddress(Address updatedAddress);

	List<Event> findEventsByVenueId(int venueId);

	Event findEventById(int eventId);


	List<Event> addToFavoriteEvents(int eventId, int userId);

	Venue findVenueById(int venueId);

	Band findBandById(int bandId);

	Artist findArtistById(int artistId);



	List<Band> listAllBands();

	Band findBandByName(String bandName);

	List<Artist> findAllArtists();




	
	
	

}
