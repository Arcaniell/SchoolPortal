package school.service;

import org.springframework.security.access.annotation.Secured;

import school.dto.ProfileDTO;

public interface ProfileService {
	@Secured("IS_AUTHENTICATED_FULLY")
	ProfileDTO loadProfile(long id);

}
