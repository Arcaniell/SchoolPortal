package school.service.implementation;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.IOUtils;
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
		try {
			return userDao.update(user);
		} catch (Exception e) {
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

		if (validateFile(fileName)) {
			try {
				InputStream inputStream = multipartFile.getInputStream();
				File image = new File(path + "/resources/img/photo/" + id
						+ ".png");
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
			} catch (Exception e) {

			}

		}

		return false;
	}

	public boolean validateFile(String fileName) {

		if (fileName.lastIndexOf(".jpg") > 0)
			return true;
		else if (fileName.lastIndexOf(".png") > 0)
			return true;
		else if (fileName.lastIndexOf(".gif") > 0)
			return true;
		else
			return false;
	}

	@Override
	public byte[] getAvatar(String id) {
		File file = new File(System.getenv("OPENSHIFT_DATA_DIR") + "photo/"
				+ id + ".png");
		String sexName = null;
		if (!file.exists()) {
			switch (userDao.findById(Long.parseLong(id)).getSex()) {
			case User.SexType.MALE:
				sexName = "male";

				break;
			case User.SexType.FEMALE:
				sexName = "female";

				break;
			case User.SexType.OTHER:
				sexName = "other";

				break;

			default:
				break;
			}
			file = new File(System.getenv("OPENSHIFT_DATA_DIR") + "photo/"
					+ sexName + ".png");
		}
		try {
			InputStream is = new FileInputStream(file);
			return IOUtils.toByteArray(is);
		} catch (IOException e) {
			return null;
		}
	}

	@Override
	public byte[] getAvatar(String id, String path) {
		File file = new File(path + "/resources/img/photo/" + id + ".png");
		String sexName = null;
		if (!file.exists()) {
			switch (userDao.findById(Long.parseLong(id)).getSex()) {
			case User.SexType.MALE:
				sexName = "male";

				break;
			case User.SexType.FEMALE:
				sexName = "female";

				break;
			case User.SexType.OTHER:
				sexName = "other";

				break;

			default:
				break;
			}
			file = new File(path + "/resources/img/photo/" + sexName + ".png");
		}
		try {
			InputStream is = new FileInputStream(file);
			return IOUtils.toByteArray(is);
		} catch (IOException e) {
			return null;
		}
	}

	@Override
	public boolean setAvatar(long id, MultipartFile multipartFile) {
		String fileName = multipartFile.getOriginalFilename();

		if (validateFile(fileName)) {
			try {
				fileName = id + ".png";
				InputStream inputStream = multipartFile.getInputStream();
				File image = new File(System.getenv("OPENSHIFT_DATA_DIR")
						+ "photo/" + id + ".png");
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
			} catch (Exception e) {

			}

		}

		return false;
	}

}
