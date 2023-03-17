package com.boat.controller.address;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class addressController {

	@GetMapping("/address")
	public String hello6() {
		return "/Address/newaddress";
	}
}
