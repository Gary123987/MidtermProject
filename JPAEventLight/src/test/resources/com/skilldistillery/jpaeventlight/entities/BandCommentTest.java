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

class BandCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BandComment bandComment;

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
		bandComment = em.find(BandComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		bandComment = null;
	}

	@Test
	void test() {
		assertNotNull(bandComment);
		assertEquals("This is my favorite band", bandComment.getComment());
		assertEquals(1, bandComment.getUser().getId());
	}
	@Test
	void replyTest() {
		bandComment = em.find(BandComment.class, 2);
		assertEquals(bandComment.getParentComment(), em.find(BandComment.class, 1));
	}

}
