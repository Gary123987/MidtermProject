package com.skilldistillery.jpaeventlight.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.Month;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class VenueCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private VenueComment venueComment;

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
		venueComment = em.find(VenueComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		venueComment = null;
	}

	@Test
	void test_VenueComment_basic_mapping() {
		assertNotNull(venueComment);
		assertEquals(Month.MARCH, venueComment.getCommentDate().getMonth());
	}
	@Test
	void test_VenueComment_to_User_ManyToOne() {
		assertNotNull(venueComment);
		assertEquals("Gary", venueComment.getUser().getFirstName());
	}
	@Test
	void test_VenueComment_to_Venue_ManyToOne() {
		assertNotNull(venueComment);
		assertEquals("FreeBird", venueComment.getVenue().getName());
	}
	@Test
	void test_VenueComment_to_ParentComment_ManyToOne() {
		assertNotNull(venueComment);
		assertNotNull(venueComment.getParentComment());
		assertEquals(1, venueComment.getParentComment().getId());
		
	}
	@Test
	void test_VenueComment_to_Replies_OneToMany(){
		assertNotNull(venueComment);
		assertNotNull(venueComment.getReplies());
		assertNotNull(venueComment.getReplies().size() > 0);
		
	}

}
