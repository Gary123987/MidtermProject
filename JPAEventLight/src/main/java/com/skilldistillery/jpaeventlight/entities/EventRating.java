package com.skilldistillery.jpaeventlight.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="event_rating")
public class EventRating {
	
	@Id
	@Column(name="user_id")
	private int userId;
	
	@Column(name = "event_id")
	private int eventId; 
	
	private int rating; 
	
	@Column(name = "rating_comment")
	private String ratingComment; 
	
	@Column(name = "rating_date")
	private LocalDateTime ratingDate;

	public EventRating() {
		
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
	public int hashCode() {
		return Objects.hash(rating, ratingComment, ratingDate, userId);
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
		return rating == other.rating && Objects.equals(ratingComment, other.ratingComment)
				&& Objects.equals(ratingDate, other.ratingDate) && userId == other.userId;
	}

	
	
	
	
	

}
