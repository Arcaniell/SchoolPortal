package school.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Locale;


import school.dto.GroupDTO;
import school.dto.GroupDataDTO;
import school.dto.GroupEditHeaderDTO;
import school.dto.GroupEditResponseDTO;
import school.dto.TeacherDTO;

/**
 * @author Blowder
 */
public interface GroupService {

    // @Secured(Role.Secured.STUDENT)

    List<GroupDTO> getStudentGroups(Principal user);

    List<GroupDTO> getTeacherGroups(Principal user, Date from, Date till);

    List<GroupDTO> getHeadTeacherGroups();

    List<GroupDataDTO> getYears();

    List<GroupDataDTO> getSymbols();

    void createNewGroup(byte year, String symbol, Long teacherId, Long courseId, String branch);

    void removeGroup(long requestId);

    GroupEditHeaderDTO getGroupEditHeaderInfo(long id, Locale loc);

    void groupUpdate(GroupEditResponseDTO dataForUpdate);

    List<String> getAvailableSymbols(byte year);

    List<TeacherDTO> getTeachers(int selector);

}
