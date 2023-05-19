package com.skilldistillery.jpaeventlight.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class VenueTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Venue venue;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAEventLight");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		venue = em.find(Venue.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		venue = null;
	}

	@Test
	void test_venue_basic_mapping() {
		assertNotNull(venue);
		assertEquals("FreeBird", venue.getName());
	}
	
	@Test
	void test_venue_to_user_OneToOne() {
		assertNotNull(venue);
		assertEquals("Fultz", venue.getUser().getLastName());
	}
	
	@Test
	void test_venue_to_address_OneToOne() {
		assertNotNull(venue);
		assertEquals("123 Fake St", venue.getAddress().getStreet());
		
	}
	
	@Test
	void test_venue_to_VenueComment_OneToMany() {
		assertNotNull(venue);
		assertNotNull(venue.getVenueComments());
		assertTrue(venue.getVenueComments().size() > 0);
		
	}

	@Test
	void test_venue_to_Event_OneToMany() {
		assertNotNull(venue);
		assertNotNull(venue.getEvents());
		assertTrue(venue.getEvents().size() > 0);
		
	}
}
