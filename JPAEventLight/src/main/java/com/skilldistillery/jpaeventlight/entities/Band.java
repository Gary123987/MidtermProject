package com.skilldistillery.jpaeventlight.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;

import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
public class Band {

	@Override
	public String toString() {
		return "Band [id=" + id + "]";
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; 
	
	private String name; 
	
	private String genre; 
	
	private String image; 
	
	private String description;
	
	@OneToMany (mappedBy = "band")
	private List<BandComment> comments;
	
	@OneToMany (mappedBy = "bandArtist")
	private List<Artist> artists;
	

	@ManyToMany(mappedBy = "favoriteBands")
	private List<User> usersFavorited;

	@ManyToMany
	@JoinTable(name = "band_has_event", 
	joinColumns = @JoinColumn(name = "band_id"),
	inverseJoinColumns = @JoinColumn(name = "event_id"))
	//@OnDelete(action = OnDeleteAction.CASCADE)
	private List<Event> events;
	
	
	public List<User> getUsersFavorited() {
		return usersFavorited;
	}

	public void setUsersFavorited(List<User> usersFavorited) {
		this.usersFavorited = usersFavorited;
	}



	public Band() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public List<BandComment> getComments() {
		return comments;
	}

	public void setComments(List<BandComment> comments) {
		this.comments = comments;
	}

	public List<Artist> getArtists() {
		return artists;
	}

	public void setArtists(List<Artist> artists) {
		this.artists = artists;
	}
	
	

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Band other = (Band) obj;
		return id == other.id;
	} 
	
	
	
}
