package com.team.order.functionorder.service;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.team.order.functionorder.domain.MealTypeBean;

@SpringBootTest
public class MealTypeServiceTests {
    @Autowired
    private MealTypeService mealTypeService;

    @Test
    public void testFindAll() {
        List<MealTypeBean> result = mealTypeService.findAll();
        // Test
        System.err.println("result:");
        for (MealTypeBean bean : result) {
            System.err.println(bean);
        }
    }

    @Test
    public void testFindById() {
        // Data
        Integer[] ids = { null, 1, 2, 50 };
        // Test
        for (Integer id : ids) {
            MealTypeBean result = mealTypeService.findById(id);
            System.err.println("param : id=" + id);
            System.err.println("result: " + result);
        }
    }

    @Test
    public void testExistsById() {
        // Data
        Integer[] ids = { null, 1, 2, 50 };
        // Test
        for (Integer id : ids) {
            boolean result = mealTypeService.existsById(id);
            System.err.println("param : id=" + id);
            System.err.println("result: " + result);
        }
    }

    @Test
    public void testInsert() {
        // Data
        MealTypeBean bean = new MealTypeBean();
        bean.setName("握壽司");
        bean.setInfo("Demo2");
        // Test
        System.err.println("result: " + mealTypeService.insert(bean));
    }

    @Test
    public void testUpdate() {
        // Data
        MealTypeBean bean = new MealTypeBean();
        bean.setId(4);
        bean.setName("握壽司");
        bean.setInfo("Demo3");
        // Test
        System.err.println("result: " + mealTypeService.update(bean));
    }

    @Test
    public void testDeleteById() {
        // Data
        Integer id = 4;
        // Test
        System.err.println(mealTypeService.deleteById(id));
    }

}
