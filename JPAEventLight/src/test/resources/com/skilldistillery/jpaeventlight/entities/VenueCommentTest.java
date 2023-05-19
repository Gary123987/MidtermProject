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

}
