package com.skilldistillery.jpaeventlight.entities;

import java.time.LocalDateTime;
import java.util.Objects;

public class BandComment {

	
	private int id; 
	
	private String comment; 
	
	private LocalDateTime commentDate;
	
	private int bandId;
	
	private int bandCommentId;
	
	private int userId;
	
	

	public BandComment() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public int getBandId() {
		return bandId;
	}

	public void setBandId(int bandId) {
		this.bandId = bandId;
	}

	public int getBandCommentId() {
		return bandCommentId;
	}

	public void setBandCommentId(int bandCommentId) {
		this.bandCommentId = bandCommentId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "BandComment [id=" + id + ", comment=" + comment + ", commentDate=" + commentDate + ", bandId=" + bandId
				+ ", bandCommentId=" + bandCommentId + ", userId=" + userId + "]";
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
		BandComment other = (BandComment) obj;
		return id == other.id;
	} 
	
	
	
	
	
	
	
	
}
