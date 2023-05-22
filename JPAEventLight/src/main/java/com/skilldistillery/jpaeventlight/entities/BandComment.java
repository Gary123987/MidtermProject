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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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

	
	

	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@OneToMany(mappedBy="parentComment")
	private List<BandComment> replies;
	
	@ManyToOne
	@JoinColumn(name="reply_id")
	private BandComment parentComment;
	
	
	
	

	public List<BandComment> getReplies() {
		return replies;
	}

	public void setReplies(List<BandComment> replies) {
		this.replies = replies;
	}

	public BandComment getParentComment() {
		return parentComment;
	}

	public void setParentComment(BandComment parentComment) {
		this.parentComment = parentComment;
	}

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




	
	
	

	public Band getBand() {
		return band;
	}

	public void setBand(Band band) {
		this.band = band;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "BandComment [id=" + id + "]";
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
