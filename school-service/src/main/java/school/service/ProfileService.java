package school.service;

import org.springframework.security.access.annotation.Secured;

import school.dto.ProfileDTO;
import school.model.Role;

public interface ProfileService {
	@Secured(Role.Secured.IS_AUTHENTICATED_FULLY)
	ProfileDTO loadProfile(long id);

}
