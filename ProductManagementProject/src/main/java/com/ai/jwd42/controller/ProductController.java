package com.ai.jwd42.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ai.jwd42.dto.Make;
import com.ai.jwd42.dto.Product;
import com.ai.jwd42.service.MakeService;
import com.ai.jwd42.service.ProductService;



@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MakeService makeService;

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView getProduct(ModelMap model, HttpServletRequest request) throws IOException {

		if (request.getSession().getAttribute("username") == null) {
			return new ModelAndView("redirect:/login");
		} else {
			Product product = new Product();
			model.addAttribute("products", productService.findAllProduct());
			return new ModelAndView("product", "command", product);
		}
	}

	@RequestMapping(value = { "/addProduct" }, method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("SpringWeb") Product product, HttpServletRequest request)
			throws IOException {

		if (request.getSession().getAttribute("username") == null) {
			return "redirect:/login";
		} else {

			if (productService.checkProductAlreadyExist(product.getModel(), product.getMaker_id())) {

				request.getSession().setAttribute("message", "This Product is Already Exist!");
				return "redirect:/product";
			} else {

				productService.insertProduct(product);
				request.getSession().setAttribute("message", "Product Adding Process is Success!");
				return "redirect:/product";
			}

		}
	}

	@RequestMapping(value = { "/updateProduct" }, method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute("SpringWeb") Product product, HttpServletRequest request)
			throws IOException {

		if (request.getSession().getAttribute("username") == null) {
			return "redirect:/login";
		} else {

			if (productService.checkProductAlreadyExist(product.getModel(), product.getMaker_id())) {
				// return error page
				request.getSession().setAttribute("message", "This product is already exist!!");
				return "redirect:/product";
			} else {

				productService.updateProduct(product);
				request.getSession().setAttribute("message", "Success User Update !");
				return "redirect:/product";
			}
		}
	}
	
	@RequestMapping(value = { "/deleteProduct" }, method = RequestMethod.POST)
	public String deleteProduct(@ModelAttribute("SpringWeb") Product product, HttpServletRequest request) throws IOException {
		
		if (request.getSession().getAttribute("username") == null) {
			return "redirect:/login";
		} else {
			productService.deleteProduct(product.getId());
			request.getSession().setAttribute("message", "Delete Product Success!");
			return "redirect:/product";

		}
	}

	@ModelAttribute("makeList")
	public Map<Integer, String> getmakeList() {

		List<Make> makes = makeService.findAllMake();
		Map<Integer, String> makeList = new HashMap<>();

		for (Make make : makes) {
			makeList.put(make.getId(), make.getName());
		}

		return makeList;

	}

}
