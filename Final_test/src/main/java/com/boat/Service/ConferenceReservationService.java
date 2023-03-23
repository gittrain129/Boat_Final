package com.boat.Service;

import java.util.List;

import com.boat.domain.ConferenceReservation;

public interface ConferenceReservationService {

	public List<ConferenceReservation> getcal(String tab);

	  public void insert1(ConferenceReservation conferenceReservation);
	
	
}
