package com.skilldistillery.jpaeventlight.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpaeventlight.entities.Artist;
import com.skilldistillery.jpaeventlight.entities.Band;
import com.skilldistillery.jpaeventlight.entities.Event;
import com.skilldistillery.jpaeventlight.entities.User;
import com.skilldistillery.jpaeventlight.entities.Venue;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User findByUsernameAndPassword(String username, String password) {
		User user = null;
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
		try{
			user = em.createQuery(jpql, User.class)
				.setParameter("un", username)
				.setParameter("pw", password)
				.getSingleResult();
			return user;
		} catch(Exception e) {
			System.err.println("Invalid login");
			return user;
		}
	}
	
//	@Override
//	public void loginService() {
//		//todo
//	}
	
	@Override
	public User signUp(User user) {
		em.persist(user);
		return user;
		}
	
//	@Override
//	public void showFavorites() {
//		//todo
//	}
	
	@Override
	public Artist createArtist(Artist artist) {
		em.persist(artist);
		return artist;
	}
	
	@Override
	public Band createBand(Band band) {
		em.persist(band);
		return band;
		
	}
	
	@Override
	public Venue createVenue(Venue venue) {
		em.persist(venue);
		return venue;
	}
	
	@Override
	public Event createEvent(Event event) {
		em.persist(event);
		return event;
		
	}
	
//	@Override
//	public void updateArtist() {
//		
//	}
//	
//	@Override
//	public void updateBand() {
//		
//	}
	
	@Override
	public Venue updateVenue(int venueId, Venue updatedVenue) {
		Venue venue = em.find(Venue.class, venueId);
		venue.setPhoneNumber(updatedVenue.getPhoneNumber());
		venue.setDescription(updatedVenue.getDescription());
		venue.setName(updatedVenue.getName());
		venue.setPicture(updatedVenue.getPicture());
		venue.setPictureLogo(updatedVenue.getPictureLogo());
		venue.setUser(updatedVenue.getUser());
		venue.setAddress(updatedVenue.getAddress());
		venue.setVenueComments(updatedVenue.getVenueComments());
		venue.setEvents(updatedVenue.getEvents());
		return venue;
	}
	
	@Override
	public Event updateEvent(int eventId, Event updatedEvent) {
		Event event = em.find(Event.class, eventId);
		event.setEventDate(updatedEvent.getEventDate());
		event.setTitle(updatedEvent.getTitle());
		event.setDescription(updatedEvent.getDescription());
		event.setImage(updatedEvent.getImage());
		event.setVenue(updatedEvent.getVenue());
		event.setStartTime(updatedEvent.getStartTime());
		event.setEndTime(updatedEvent.getEndTime());
		event.setBands(updatedEvent.getBands());
		return event;
		
	}
	
	@Override
	public boolean deleteArtist(int artistId) {
		Artist artist = em.find(Artist.class, artistId);
		em.remove(artist);
		if (artist == null) {
			return true;
		} else {
			return false;
		}
		
	}
	
	@Override
	public boolean deleteBand(int bandId) {
		Band band = em.find(Band.class, bandId);
		em.remove(band);
		if (band == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean deleteVenue(int venueId) {
		Venue venue = em.find(Venue.class, venueId);
		em.remove(venue);
		if (venue == null) {
			return true;
		} else {
			return false;
		}
		
	}
	
	@Override
	public boolean deleteEvent(int eventId) {
		Event event = em.find(Event.class, eventId);
		em.remove(event);
		if (event == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean deleteUser(int userId) {
		User user = em.find(User.class, userId);
		em.remove(user);
		if (user == null) {
			return true;
		} else {
			return false;
		}
	}
//	@Override
//	public void filter() {
//		
//	}
	
	@Override
	public List<Event> findAllEvents(){
		String jpql = "SELECT e FROM Event e";
		return em.createQuery(jpql, Event.class).getResultList();	
		}
	
	
	
	
	
	

}
