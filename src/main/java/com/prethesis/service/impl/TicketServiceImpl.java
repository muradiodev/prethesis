package com.prethesis.service.impl;

import com.prethesis.mapper.TicketMapper;
import com.prethesis.model.dtos.CatTicketView;
import com.prethesis.model.dtos.NpsView;
import com.prethesis.model.dtos.TicketView;
import com.prethesis.entity.Tickets;
import com.prethesis.model.ResponseData;
import com.prethesis.repo.RepoTicket;
import com.prethesis.service.TicketService;
import com.prethesis.util.generateresponse.GenerateResponseUtility;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import static com.prethesis.util.generateresponse.Constants.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService {

    private final RepoTicket repoTicket;
    private TicketMapper ticketMapper = TicketMapper.INSTANCE;

    @Override
    public ResponseData<TicketView> create(TicketView ticketView) {
        Tickets ticket = Tickets.builder()
                .name(ticketView.getName())
                .email(ticketView.getEmail())
                .browserName(ticketView.getBrowserName())
                .browserFontSize(ticketView.getBrowserFontSize())
                .screenWidth(ticketView.getScreenResolution().getWidth())
                .screenHeight(ticketView.getScreenResolution().getHeight())
                .userIp(ticketView.getUserIp())
                .postDate(LocalDate.now())
                .isActive(1)
                .skillRate(ticketView.getSkillRate())
                .satScore(ticketView.getSatScore())
                .m1(ticketView.getM1())
                .m2(ticketView.getM2())
                .m3(ticketView.getM3())
                .gender(ticketView.getGender())
                .priority(0)
                .build();
        repoTicket.save(ticket);
        return GenerateResponseUtility.ticketDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, null);
    }

    private TicketView getTicketView(Tickets ticket) {
        return ticketMapper.toTicketView(ticket);
    }

    @Override
    public ResponseData<List<TicketView>> getAll() {
        List<Tickets> tickets = repoTicket.findAll();

        List<TicketView> tv = tickets.stream()
                .map(this::getTicketView)
                .collect(Collectors.toList());

        if (tickets.size() == 0) {
            log.info("ticket detail not found : ");
            return GenerateResponseUtility.ticketDetails.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, null);
        }
        log.info("ticket detail found : ");
        return GenerateResponseUtility.ticketDetails.generate(SUCCESS_CODE, SUCCESS_MESSAGE, tv);
    }

    @Override
    public ResponseData<TicketView> getTicketDetails(String id) {
        return repoTicket.findById(id).map(tickets -> GenerateResponseUtility
                .ticketDetail
                .generate(SUCCESS_CODE, SUCCESS_MESSAGE, getTicketView(tickets))
        ).orElse(GenerateResponseUtility.ticketDetail.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, null));
    }

    @Override
    public ResponseData<NpsView> getRate() {
        int detractors = repoTicket.countAllByRateGreaterThanEqualAndRateLessThanEqual(0, 6);
        int passives = repoTicket.countAllByRateGreaterThanEqualAndRateLessThanEqual(7, 8);
        int promoters = repoTicket.countAllByRateGreaterThanEqualAndRateLessThanEqual(9, 10);
        int all = repoTicket.countAllByRateGreaterThanEqualAndRateLessThanEqual(0, 10);

        int happy = (promoters / all) * 100;
        int sad = (passives / all) * 100;
        int nps = 100 * (happy - sad);

        return GenerateResponseUtility.npsView.generate(SUCCESS_CODE, SUCCESS_MESSAGE, NpsView.builder()
                .promoters(promoters)
                .detractors(detractors)
                .all(all)
                .passives(passives)
                .happy(happy)
                .sad(sad)
                .nps(nps)
                .build());
    }

    @Override
    public ResponseData<List<CatTicketView>> getCategoryTickets() {
        return GenerateResponseUtility.catTicket.generate(SUCCESS_CODE, SUCCESS_MESSAGE, repoTicket.catTicketView());
    }


}
