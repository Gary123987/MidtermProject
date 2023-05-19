package com.skilldistillery.jpaeventlight.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.awt.datatransfer.SystemFlavorMap;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_basic_mapping() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("Gary", user.getFirstName());
	}
	
	@Test
	void test_User_to_Address_OneToOne() {
		assertNotNull(user);
		assertEquals("Jacksonville", user.getAddress().getCity());
	}
	@Test
	void test_User_to_venue_OnetoOne() {
		assertNotNull(user);
		assertEquals("FreeBird", user.getVenue().getName());
	}
	@Test
	void test_User_to_VenueComment_OnetoMany() {
		assertNotNull(user);
		assertTrue(user.getVenueComments().size() > 0);
	}

}
