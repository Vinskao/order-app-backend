package com.team.order.functionorder.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team.order.functionorder.domain.MealTypeBean;

public interface MealTypeRepository extends JpaRepository<MealTypeBean, Integer> {

}
