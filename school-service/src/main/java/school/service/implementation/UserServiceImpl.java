package school.service.implementation;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import school.dao.UserDao;
import school.model.User;
import school.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Transactional
	public User loadUser(long id) {
		return userDao.findById(id);
	}

	@Override
	public boolean isEmailAviable(String email) {
		if (userDao.findByEmail(email) == null)
			return true;
		else
			return false;
	}

	@Override
	public User createUser(User user) {
		try{
		return userDao.update(user);
		}catch(Exception e){
		return null;
		}
	}

	@Override
	public void test403() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User findByEmail(String email) {
		return userDao.findByEmail(email);
	}

	@Override
	public boolean setAvatar(long id, MultipartFile multipartFile, String path) {

		String fileName = multipartFile.getOriginalFilename();
		
		if(validateFile(fileName)){
			try{
			fileName = id + ".png";
			InputStream inputStream = multipartFile.getInputStream();
			//String pathh = "/home/romamr/softserve/LogsOfSP/";
			System.out.println("aaaaaaaaaaaa"+path+"/resources/img/logos/");
			File image = new File(path+"/resources/img/logos/"+fileName);
			if (!image.exists()) {
				image.createNewFile();
			}

			OutputStream outputStream = new FileOutputStream(image);
			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}
			outputStream.close();
			return true;
			}catch(Exception e){
				
			}
			
		}
		
		
		
		
//		
//		BufferedImage bi = multipartFile.g
//	    File outputfile = new File("saved.png");
//	    ImageIO.write(bi, "png", outputfile);

				// request.getServletContext().getRealPath("")+"/resources/img/logos/");
				// model.addAttribute("aa",
				// request.getServletContext().getRealPath("")+"/resources/img/logos/");	
//		file = new File(path+"3.png");
//		File newFile = new File(path+"2.png");
//		try {
//			FileUtils.copyFile(file, newFile);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		return false;
	}
	
	public boolean validateFile(String fileName){
		
		if(fileName.lastIndexOf(".jpg")>0)return true;
		else
		if(fileName.lastIndexOf(".png")>0)return true;
		else
		if(fileName.lastIndexOf(".gif")>0)return true;
		else
		return false;
	}
}
