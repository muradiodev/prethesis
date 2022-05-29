package com.prethesis.service.impl;

import com.prethesis.entity.Categories;
import com.prethesis.mapper.TicketMapper;
import com.prethesis.model.dtos.CatTicketView;
import com.prethesis.model.dtos.NpsView;
import com.prethesis.model.dtos.TicketView;
import com.prethesis.entity.Tickets;
import com.prethesis.model.ResponseData;
import com.prethesis.repo.RepoCategory;
import com.prethesis.repo.RepoTicket;
import com.prethesis.service.TicketService;
import com.prethesis.util.generateresponse.GenerateResponseUtility;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import static com.prethesis.util.generateresponse.Constants.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService {

    private final RepoTicket repoTicket;
    private final RepoCategory repoCategory;
    private TicketMapper ticketMapper = TicketMapper.INSTANCE;

    @Override
    public ResponseData<TicketView> create(TicketView ticketView) {
//        Tickets ticket = Tickets.builder()
//                .name(ticketView.getName())
//                .email(ticketView.getEmail())
//                .browserName(ticketView.getBrowserName())
//                .browserFontSize(ticketView.getBrowserFontSize())
//                .screenWidth(ticketView.getScreenResolution().getWidth())
//                .screenHeight(ticketView.getScreenResolution().getHeight())
//                .userIp(ticketView.getUserIp())
//                .postDate(LocalDate.now())
//                .isActive(1)
//                .skillRate(ticketView.getSkillRate())
//                .satScore(ticketView.getSatScore())
//                .m1(ticketView.getM1())
//                .m2(ticketView.getM2())
//                .m3(ticketView.getM3())
//                .gender(ticketView.getGender())
//                .priority(0)
//                .build();
//        repoTicket.save(ticket);
        return GenerateResponseUtility.ticketDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, null);
    }
//    ?

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
        Categories category = new Categories();
        TicketView ticketView;

        ResponseData<TicketView> ticketViewResponseData = repoTicket.findById(id).map(tickets -> GenerateResponseUtility
                .ticketDetail
                .generate(SUCCESS_CODE, SUCCESS_MESSAGE, getTicketView(tickets))
        ).orElse(GenerateResponseUtility.ticketDetail.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, null));

        Categories cat = repoCategory.findNameById(ticketViewResponseData.getBody().getCategory().getId());

        category.setId(ticketViewResponseData.getBody().getCategory().getId());
        category.setName(cat.getName());
        ticketView = ticketViewResponseData.getBody();
        ticketView.setCategory(category);

        return GenerateResponseUtility.ticketDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, ticketView);
    }

    @Override
    public ResponseData<NpsView> getRate() {
        int detractors = repoTicket.countAllBySkillRateGreaterThanEqualAndSkillRateLessThanEqual(0, 6);
        int passives = repoTicket.countAllBySkillRateGreaterThanEqualAndSkillRateLessThanEqual(7, 8);
        int promoters = repoTicket.countAllBySkillRateGreaterThanEqualAndSkillRateLessThanEqual(9, 10);
        int all = repoTicket.countAllBySkillRateGreaterThanEqualAndSkillRateLessThanEqual(0, 10);

        int happy = (promoters / all) * 100;
        int sad = (passives / all) * 100;
        int nps = 100 * (happy - sad);
//s
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

    @Override
    public ResponseData<TicketView> update(TicketView ticketView) {
        log.info("categoryView : {}", ticketView);

        repoTicket.findById(ticketView.getId()).ifPresent(ticket -> {
            ticket.setIdCategory(ticketView.getCategory().getId());
            repoTicket.save(ticket);
        });

        return GenerateResponseUtility.ticketDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, ticketView);
    }

    @Override
    public ResponseData<TicketView> setPriority(TicketView ticketView) {
        log.info("categoryView : {}", ticketView);

        repoTicket.findById(ticketView.getId()).ifPresent(ticket -> {
            ticket.setPriority(ticketView.getPriority());
            repoTicket.save(ticket);
        });

        return GenerateResponseUtility.ticketDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, ticketView);
    }


}
