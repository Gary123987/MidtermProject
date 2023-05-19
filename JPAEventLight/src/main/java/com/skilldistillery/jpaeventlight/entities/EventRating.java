package com.skilldistillery.jpaeventlight.entities;

import java.time.LocalDateTime;
import java.util.Objects;

public class EventRating {
	
	private int userId;
	
	private int eventId; 
	
	private int rating; 
	
	private String ratingComment; 
	
	private LocalDateTime ratingDate;

	public EventRating() {
		
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getRatingComment() {
		return ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

	public LocalDateTime getRatingDate() {
		return ratingDate;
	}

	public void setRatingDate(LocalDateTime ratingDate) {
		this.ratingDate = ratingDate;
	}

	@Override
	public String toString() {
		return "EventRating [userId=" + userId + ", eventId=" + eventId + ", rating=" + rating + ", ratingComment="
				+ ratingComment + ", ratingDate=" + ratingDate + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(eventId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EventRating other = (EventRating) obj;
		return eventId == other.eventId;
	} 
	
	
	
	

}
