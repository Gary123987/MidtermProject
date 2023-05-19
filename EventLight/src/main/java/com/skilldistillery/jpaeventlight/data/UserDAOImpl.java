package com.skilldistillery.jpaeventlight.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpaeventlight.entities.User;

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
		} catch(Exception e) {
			System.err.println("Invalid login");
		}
		return user;
	}
	
	@Override
	public void loginService() {
		//todo
	}
	
	@Override
	public void signUp() {
		//todo
	}
	
	@Override
	public void showFavorites() {
		//todo
	}
	
	@Override
	public void createArtist() {
		
	}
	
	@Override
	public void createBand() {
		
	}
	
	@Override
	public void createVenue() {
		
	}
	
	@Override
	public void createEvent() {
		
	}
	
	@Override
	public void updateArtist() {
		
	}
	
	@Override
	public void updateBand() {
		
	}
	
	@Override
	public void updateVenue() {
		
	}
	
	@Override
	public void updateEvent() {
		
	}
	
	@Override
	public void deleteArtist() {
		
	}
	
	@Override
	public void deleteBand() {
		
	}
	
	@Override
	public void deleteVenue() {
		
	}
	
	@Override
	public void deleteEvent() {
		
	}
	
	@Override
	public void filter() {
		
	}
	
	
	
	

}
