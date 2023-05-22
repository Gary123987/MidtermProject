package com.skilldistillery.jpaeventlight.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpaeventlight.entities.Address;
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
		try {
			user = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("pw", password)
					.getSingleResult();
			return user;
		} catch (Exception e) {
			System.err.println("Invalid login");
			return user;
		}
	}

//	@Override
//	public void loginService() {
//		//todo
//	}

	@Override
	public User signUp(User user, Address address) {
		em.persist(address);
		em.persist(user);
		//em.flush();
		return user;
	}

//	@Override
//	public TVShow add(TVShow show) {
//		em.persist(show);
//		em.flush();
//		return show;
//	}

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
	public Venue createVenue(Venue venue, Address address) {
		em.persist(address);
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
	public Venue updateVenue(Venue updatedVenue) {
		return em.merge(updatedVenue);
	}
	
	@Override
	public Address updateAddress(Address updatedAddress) {
		return em.merge(updatedAddress);
	}

	@Override
	public Event updateEvent(Event updatedEvent) {
		return em.merge(updatedEvent);

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
	public List<Event> findAllEvents() {
		String jpql = "SELECT e FROM Event e";
		return em.createQuery(jpql, Event.class).getResultList();
	}
	
	@Override
	public List<Event> findEventsByVenueId(int venueId){
		String jpql = "SELECT e FROM Event e WHERE e.venue.id = :venueId";
		List<Event> eventsById = em.createQuery(jpql, Event.class).setParameter("venueId", venueId).getResultList();
		return eventsById;
		
	}
	
	@Override
	public Event findEventById(int eventId) {
		return em.find(Event.class, eventId);
	}

}
