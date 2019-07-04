package com.app.mvc.business.controller;

import com.app.mvc.beans.JsonData;
import com.app.mvc.beans.PageQuery;
import com.app.mvc.business.service.ProductService;
import com.app.mvc.business.vo.ProductPara;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @ResponseBody
    @RequestMapping(value = "page.json", method = RequestMethod.GET)
    public JsonData productQuery(PageQuery pageQuery) {
        return JsonData.success(productService.getPage(pageQuery));
    }

    @ResponseBody
    @RequestMapping(value = "save.json")
    public JsonData save(ProductPara para) {
        productService.save(para);
        return JsonData.success();
    }

    @ResponseBody
    @RequestMapping(value = "delete.json")
    public JsonData delete(@RequestParam("id") int id) {
        productService.delete(id);
        return JsonData.success();
    }
}
