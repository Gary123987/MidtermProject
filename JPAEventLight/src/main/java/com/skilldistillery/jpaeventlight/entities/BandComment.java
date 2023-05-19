package com.skilldistillery.jpaeventlight.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="band_comment")
public class BandComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; 
	
	private String comment; 
	
	@Column(name = "comment_date")
	private LocalDateTime commentDate;
	
	@ManyToOne
	@JoinColumn(name = "band_id")
	private Band band;

	
	
	@Column(name = "band_comment_id")
	private Integer bandCommentId;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	
	

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



	public int getBandCommentId() {
		return bandCommentId;
	}

	public void setBandCommentId(int bandCommentId) {
		this.bandCommentId = bandCommentId;
	}
	


	public void setBandCommentId(Integer bandCommentId) {
		this.bandCommentId = bandCommentId;
	}
	
	

	@Override
	public String toString() {
		return "BandComment [id=" + id + ", comment=" + comment + ", commentDate=" + commentDate + ", bandCommentId="
				+ bandCommentId + "]";
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
