package com.boat.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boat.domain.ConferenceReservation;

@Mapper
public interface ConferenceReservationMapper {

	 public List<ConferenceReservation> getcal(String tab);
	 
	 public void insert1(ConferenceReservation conferenceReservation);
}