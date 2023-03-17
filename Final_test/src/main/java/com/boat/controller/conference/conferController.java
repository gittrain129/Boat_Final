package com.boat.controller.conference;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class conferController {


	@GetMapping("/confer")
	public String hello2() {
		return "/Conference_Res/conferMain";
	}
}
