package com.azshop.models;

public class BookModel {
	private String isbn13;
	private String isbn10;
	private String title;
	private String subtitle;
	private String authors;
	private String categories;
	private String thumbnail;
	private String description;
	private int published_year;
	private float average_rating;
	private int num_pages;
	private int ratings_count;
	public String getIsbn13() {
		return isbn13;
	}
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	public String getIsbn10() {
		return isbn10;
	}
	public void setIsbn10(String isbn10) {
		this.isbn10 = isbn10;
	}
	public String getTitle() {
		return title;
	}
	public BookModel() {
		super();
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getAuthors() {
		return authors;
	}
	public void setAuthors(String authors) {
		this.authors = authors;
	}
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPublished_year() {
		return published_year;
	}
	public void setPublished_year(int published_year) {
		this.published_year = published_year;
	}
	public float getAverage_rating() {
		return average_rating;
	}
	public void setAverage_rating(float average_rating) {
		this.average_rating = average_rating;
	}
	public int getNum_pages() {
		return num_pages;
	}
	public void setNum_pages(int num_pages) {
		this.num_pages = num_pages;
	}
	public int getRatings_count() {
		return ratings_count;
	}
	public void setRatings_count(int ratings_count) {
		this.ratings_count = ratings_count;
	}
	
	
}
