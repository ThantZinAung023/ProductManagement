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
import com.ai.jwd42.dto.Printer;
import com.ai.jwd42.dto.Product;
import com.ai.jwd42.service.PrinterService;
import com.ai.jwd42.service.ProductService;

@Controller
public class PrinterController {

	@Autowired
	private PrinterService printerService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/printer", method = RequestMethod.GET)
	public ModelAndView getPrinter(ModelMap model, HttpServletRequest request) throws IOException {

		if (request.getSession().getAttribute("username") == null) {
			return new ModelAndView("redirect:/login");
		} else {

			Printer printer = new Printer();
			model.addAttribute("printers",printerService.findAllPrinter());
			return new ModelAndView("printer", "command", printer);
		}
	}

	@RequestMapping(value = { "/addPrinter" }, method = RequestMethod.POST)
	public String addPrinter(@ModelAttribute("SpringWeb") Printer printer, HttpServletRequest request)
			throws IOException {

		if (request.getSession().getAttribute("username") == null) {
			return "redirect:/login";
		} else {

			if (printerService.checkPrinterAlreadyExist(printer.getProduct_id(), printer.getColor(),
					printer.getPrice())) {

				request.getSession().setAttribute("message", "This Printer is Already Exist!");
				return "redirect:/printer";
			} else {

				printerService.insertPrinter(printer);
				request.getSession().setAttribute("message", "Printer Adding Process is Success!");
				return "redirect:/printer";

			}
		}
	}

	@RequestMapping(value = { "/updatePrinter" }, method = RequestMethod.POST)
	public String updatePrinter(@ModelAttribute("SpringWeb") Printer printer, HttpServletRequest request)
			throws IOException {

		if (request.getSession().getAttribute("username") == null) {
			return "redirect:/login";
		} else {
			if (printerService.checkPrinterAlreadyExist(printer.getProduct_id(), printer.getColor(),
					printer.getPrice())) {
				// return error page
				request.getSession().setAttribute("message", "This printer is already exist!!");
				return "redirect:/printer";
			} else {

				printerService.updatePrinter(printer);
				request.getSession().setAttribute("message", "Success Printer Update !");
				return "redirect:/printer";

			}
		}
	}
	
	@RequestMapping(value = { "/deletePrinter" }, method = RequestMethod.POST)
	public String deletePrinter(@ModelAttribute("SpringWeb") Printer printer, HttpServletRequest request) throws IOException {
		
		if (request.getSession().getAttribute("username") == null) {
			return "redirect:/login";
		} else {
			printerService.deletePrinter(printer.getId());
			request.getSession().setAttribute("message", "Delete Printer Success!");
			return "redirect:/printer";
		}
	}
	
	
	@ModelAttribute("productList")
	public Map<Integer, String> getProductList() {

		List<Product> products = productService.findAllProduct();
		Map<Integer, String> productList = new HashMap<>();

		for (Product product : products) {
			productList.put(product.getId(), product.getModel());
		}

		return productList;

	}

}
