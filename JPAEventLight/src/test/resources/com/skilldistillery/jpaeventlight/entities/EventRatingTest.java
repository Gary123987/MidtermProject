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

class EventRatingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventRating eventRating;

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
		eventRating = em.find(EventRating.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		eventRating = null;
	}

	@Test
	void test() {
		assertNotNull(eventRating);
	}
}
