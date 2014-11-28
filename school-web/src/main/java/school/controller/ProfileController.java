package school.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.sym.Name;

import school.service.ProfileService;
import school.service.UserService;

@Controller
public class ProfileController {

	@Inject
	ProfileService profileService;
	@Inject
	UserService userService;



	@RequestMapping(value = "profile/information")
	public String profileInformation(Model model,
			@RequestParam(value = "id") Long id) {
		model.addAttribute("profile", profileService.loadProfile(id));
		return "profile_information";
	}

	@RequestMapping(value = "profile")
	public String profile(Model model, Principal principal) {
		if (principal == null) {
			return "redirect:/login";
		}
		model.addAttribute("profile",
				profileService.loadProfile(Long.parseLong(principal.getName())));
		return "profile";
	}

	
	@RequestMapping(value = "profile/upload_avatar", method = RequestMethod.POST)
	public String profileUploadAvatar(HttpServletRequest request,
			Principal principal, Model model,
			@ModelAttribute("file") UploadedFile uploadedFile) {
		if (principal == null) {
			return "redirect:/login";
		}
		userService.setAvatar(Long.parseLong(principal.getName()), uploadedFile.getFile(), request.getServletContext().getRealPath(""));
		
		return "redirect:/profile";
		//return userService.setAvatar(Long.parseLong(principal.getName()), multipartFile, request.getServletContext().getRealPath(""));
	}
	
	@RequestMapping(value="/fileUpload",method = RequestMethod.POST)
	public String fileUploaded(
			@ModelAttribute("file") UploadedFile uploadedFile,
			Principal principal, Map<String, Object> model) {
		InputStream inputStream = null;
		OutputStream outputStream = null;

		if(uploadedFile != null && uploadedFile.getFile()  != null && uploadedFile.getFile().getSize() >0)
			return "profile";
		else return "journal";
//		if (uploadedFile.getFile().getSize() == 0)return signinAccount(principal, model);
//		MultipartFile file = (MultipartFile) uploadedFile.getFile();
//		final String username = principal.getName();
//		User userEntity = userDao.findByName(username);
//
//		String fileName = file.getOriginalFilename();
//		
//		if(!myValidation(fileName))return signinAccount(principal, model);
//		
//		fileName = username + ".png";
//
//
//		try {
//			inputStream = file.getInputStream();
//			File newFile = new File(
//					"E:/EclipseEE/eeworkspace/strategicworld/src/main/webapp/resources/userimg/"
//							+ fileName);
//			if (!newFile.exists()) {
//				newFile.createNewFile();
//			}
//			userEntity.setImage(fileName);
//			userEntity = userDao.update(userEntity);
//			outputStream = new FileOutputStream(newFile);
//			int read = 0;
//			byte[] bytes = new byte[1024];
//
//			while ((read = inputStream.read(bytes)) != -1) {
//				outputStream.write(bytes, 0, read);
//			}
//			outputStream.close();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return signinAccount(principal, model);
	}
}
