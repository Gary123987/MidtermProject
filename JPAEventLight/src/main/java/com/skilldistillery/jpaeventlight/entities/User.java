package com.skilldistillery.jpaeventlight.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;


	private String username;
	private String password;
	private Boolean enabled;
	private String role;
	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "created_at")
	@CreationTimestamp
	private LocalDateTime createdAt;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;

	@Column(name = "profile_picture")
	private String profilePicture;

	@Column(name = "about_me")
	private String aboutMe;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;


	@OneToMany(mappedBy = "user")
	private List<BandComment> bandComments;
	
	@OneToOne(mappedBy = "user")
	private Venue venue;

	@OneToMany(mappedBy = "user")
	private List<VenueComment> venueComments;
	
	@ManyToMany
	@JoinTable(name="favorite_band",
		joinColumns=@JoinColumn(name="user_id"),
		inverseJoinColumns=@JoinColumn(name="band_id"))
	private List<Band>favoriteBands;
	
	@ManyToMany
	@JoinTable(name="favorite_events",
		joinColumns=@JoinColumn(name="user_id"),
		inverseJoinColumns=@JoinColumn(name="event_id"))
	private List<Event> favoriteEvents;

	@OneToMany(mappedBy = "user")
	private List<EventRating> eventRatings;

	public List<BandComment> getBandComments() {
		return bandComments;
	}

	public void setBandComments(List<BandComment> bandComments) {
		this.bandComments = bandComments;
	}

	public List<Band> getFavoriteBands() {
		return favoriteBands;
	}

	public void setFavoriteBands(List<Band> favoriteBands) {
		this.favoriteBands = favoriteBands;
	}

	public List<Event> getFavoriteEvents() {
		return favoriteEvents;
	}

	public void setFavoriteEvents(List<Event> favoriteEvents) {
		this.favoriteEvents = favoriteEvents;
	}

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}


	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public List<VenueComment> getVenueComments() {
		return venueComments;
	}

	public void setVenueComments(List<VenueComment> venueComments) {
		this.venueComments = venueComments;
	}


	public List<EventRating> getEventRatings() {
		return eventRatings;
	}

	public void setEventRatings(List<EventRating> eventRatings) {
		this.eventRatings = eventRatings;
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
		User other = (User) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", firstName=" + firstName + ", lastName=" + lastName + ", createdAt=" + createdAt
				+ ", lastUpdate=" + lastUpdate + ", profilePicture=" + profilePicture + ", aboutMe=" + aboutMe
				+ ", address=" + address + ", bandComments=" + bandComments + ", venue=" + venue + ", venueComments="
				+ venueComments + ", favoriteBands=" + favoriteBands + ", favoriteEvents=" + favoriteEvents
				+ ", eventRatings=" + eventRatings + "]";
	}



}
