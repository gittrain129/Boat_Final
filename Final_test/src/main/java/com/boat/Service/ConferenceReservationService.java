package com.boat.Service;

import java.util.List;

import com.boat.domain.ConferenceReservation;

public interface ConferenceReservationService {

	public List<ConferenceReservation> findAll();

	  public void insert1(ConferenceReservation conferenceReservation);
	
	
}
