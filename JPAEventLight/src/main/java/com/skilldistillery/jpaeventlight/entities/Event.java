package com.skilldistillery.jpaeventlight.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="event_date")
	private LocalDate eventDate;
	
	private String title;
	
	private String description;
	
	private String image;
	
	@Column(name="created_at")
	@CreationTimestamp
	private LocalDateTime createdAt;

	@Column(name="last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;
	
	@Column(name="start_time")
	private LocalTime startTime;

	@Column(name="end_time")
	private LocalTime endTime;

	@ManyToOne
	@JoinColumn(name="venue_id")
	private Venue venue;
	

	@ManyToMany(mappedBy = "favoriteEvents")
	private List<User> usersFavorited;
	


	@ManyToMany(mappedBy = "events")
	private List<Band> bands;
	
	public List<User> getUsersFavorited() {
		return usersFavorited;
	}
	
	public void setUsersFavorited(List<User> usersFavorited) {
		this.usersFavorited = usersFavorited;
	}
	
	@OneToMany(mappedBy = "event")
	private List<EventRating> eventRatings;

	public Event() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getEventDate() {
		return eventDate;
	}

	public void setEventDate(LocalDate eventDate) {
		this.eventDate = eventDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	public LocalTime getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}
	
	

	public List<Band> getBands() {
		return bands;
	}

	public void setBands(List<Band> bands) {
		this.bands = bands;
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
		Event other = (Event) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", eventDate=" + eventDate + ", title=" + title + ", description=" + description
				+ ", image=" + image + ", createdAt=" + createdAt + ", lastUpdate=" + lastUpdate + ", startTime="
				+ startTime + ", endTime=" + endTime + ", venue=" + venue + ", usersFavorited=" + usersFavorited
				+ ", bands=" + bands + ", eventRatings=" + eventRatings + "]";
	}
	
	
}
