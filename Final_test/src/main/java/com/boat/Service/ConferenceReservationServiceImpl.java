package com.boat.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boat.domain.ConferenceReservation;
import com.boat.mybatis.mapper.ConferenceReservationMapper;

@Service
public class ConferenceReservationServiceImpl implements ConferenceReservationService{

	
	  private ConferenceReservationMapper conferenceReservationMapper;
	  
	  @Autowired
	  public ConferenceReservationServiceImpl(ConferenceReservationMapper conferenceReservationMapper) {
		  this.conferenceReservationMapper = conferenceReservationMapper;
	  }
	
	@Override
	 public List<ConferenceReservation> findAll() {
		    return conferenceReservationMapper.findAll();
		  }

	@Override
	public void insert1(ConferenceReservation conferenceReservation) {
		conferenceReservationMapper.insert1(conferenceReservation);
		
	}






	
	
	
}
